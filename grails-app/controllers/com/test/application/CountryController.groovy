package com.test.application

import grails.gorm.transactions.Transactional

class CountryController {

    @Transactional
    def save() {
        def country = Country.exists(params.id) ? Country.get(params.id) : new Country()
        country.name = params.name
        country.capital = params.capital
        if (country.hotels != null && !country.hotels.isEmpty()) {
            country.hotels*.delete()
            country.hotels.clear()
        }
        country.save(failOnError: true)
        params.hotels.each { hotelId ->
            def hotel = Hotel.get(hotelId)
            def countryHotel = new CountryHotel("country": country, "hotel": hotel)
            country.addToHotels(countryHotel)
            countryHotel.save(failOnError: true)
        }
        country.save(failOnError: true, flush: true)
        redirect(action: "list")
    }

    def list() {
        return [countries: Country.list(sort: "name", order: "asc")]
    }

    def show() {
        return [country: Country.get(params.id)]
    }

    def create() {
        return [hotels: Hotel.list()]
    }

    def edit() {
        return [country: Country.get(params.id), hotels: Hotel.list()]
    }

    @Transactional
    def delete() {
        def country = Country.get(params.id)
        country.delete(flush: true)
        redirect(action: "list")
    }
}
