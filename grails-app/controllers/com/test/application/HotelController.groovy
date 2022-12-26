package com.test.application

import grails.gorm.transactions.Transactional

class HotelController {

    @Transactional
    def save() {
        def hotel = Hotel.exists(params.id) ? Hotel.get(params.id) : new Hotel()
        hotel.name = params.name
        hotel.stars = params.stars as Integer
        hotel.link = params.link
        hotel.save(failOnError: true, flush: true)
        redirect(action: "list")
    }

    def list() {
        return [hotels: Hotel.list(sort: "stars", order: "desc")]
    }

    def show() {
        return [hotel: Hotel.get(params.id)]
    }

    def create() {

    }

    def edit() {
        return [hotel: Hotel.get(params.id)]
    }

    @Transactional
    def delete() {
        def hotel = Hotel.get(params.id)
        hotel.delete(flush: true)
        redirect(action: "list")
    }
}
