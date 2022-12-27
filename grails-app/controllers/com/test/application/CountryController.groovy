package com.test.application

import grails.gorm.transactions.Transactional

class CountryController {

    @Transactional
    def save() {
        Country country = Country.exists(params.id) ? Country.get(params.id) : new Country()
        country.name = params.name
        country.capital = params.capital
        if (country.hotels != null && !country.hotels.isEmpty()) {
            country.hotels*.delete()
            country.hotels.clear()
        }
        if (country.validate()) {
            country.save(failOnError: true, flush: true)
            params.hotels.each { hotelId ->
                def hotel = Hotel.get(hotelId)
                def countryHotel = new CountryHotel("country": country, "hotel": hotel)
                country.addToHotels(countryHotel)
                countryHotel.save(failOnError: true)
            }
            country.save(failOnError: true, flush: true)
            redirect(action: "list")
        } else {
            if (country.hasErrors()) {
                render(
                        view: Country.exists(params.id) ? "edit" : "create",
                        model: [country: country, hotels: Hotel.list(),
                                errorCode: "com.test.application.Country.name.not.unique.message"]
                )
            }
        }
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
