package com.test

import com.test.application.Country
import com.test.application.CountryHotel
import com.test.application.Hotel
import grails.gorm.transactions.Transactional

class BootStrap {

    def init = { servletContext ->
        mainInit()
    }

    def destroy = {

    }

    def hotelsInit() {
        def oneStarHotel = new Hotel(name: "Cringe Hotel", stars: 1)
        def twoStarHotel = new Hotel(name: "Lighthouse", stars: 2)
        def threeStarHotel = new Hotel(name: "Drifting Hotel", stars: 3)
        def fourStarHotel = new Hotel(name: "Rivera", stars: 4, link: "https://rivera.com")
        def fiveStarHotel = new Hotel(name: "Laguna Hotel", stars: 5, link: "hhhtp:/joke.com")
        return ["one": oneStarHotel,
                "two": twoStarHotel,
                "three": threeStarHotel,
                "four": fourStarHotel,
                "five": fiveStarHotel]
    }

    def countriesInit() {
        def russia = new Country(name: "Russia", capital: "Moscow")
        def greatBritain = new Country(name: "Great Britain", capital: "London")
        def china = new Country(name: "China", capital: "Beijing")
        def german = new Country(name: "German", capital: "Berlin")
        def armenia = new Country(name: "Armenia", capital: "Yerevan")
        def tatarstan = new Country(name: "Tatarstan", capital: "Kazan")
        def southKorea = new Country(name: "South Korea", capital: "Seoul")
        return ["russia": russia,
                "greatBritain": greatBritain,
                "china": china,
                "german": german,
                "armenia": armenia,
                "tatarstan": tatarstan,
                "southKorea": southKorea]
    }

    def countriesHotelsInit(countries, hotels) {
        def russia1 = createCountryHotel(countries.get("russia"), hotels.get("one"))
        def russia2 = createCountryHotel(countries.get("russia"), hotels.get("five"))
        def greatBritain1 = createCountryHotel(countries.get("greatBritain"), hotels.get("two"))
        def greatBritain2 = createCountryHotel(countries.get("greatBritain"), hotels.get("four"))
        def china1 = createCountryHotel(countries.get("china"), hotels.get("one"))
        def china2 = createCountryHotel(countries.get("china"), hotels.get("five"))
        def german1 = createCountryHotel(countries.get("german"), hotels.get("two"))
        def german2 = createCountryHotel(countries.get("german"), hotels.get("four"))
        def armenia1 = createCountryHotel(countries.get("armenia"), hotels.get("two"))
        def armenia2 = createCountryHotel(countries.get("armenia"), hotels.get("three"))
        def tatarstan1 = createCountryHotel(countries.get("tatarstan"), hotels.get("one"))
        def tatarstan2 = createCountryHotel(countries.get("tatarstan"), hotels.get("two"))
        def southKorea1 = createCountryHotel(countries.get("southKorea"), hotels.get("four"))
        def southKorea2 = createCountryHotel(countries.get("southKorea"), hotels.get("five"))
        return ["russia" : [russia1, russia2],
                "greatBritain": [greatBritain1, greatBritain2],
                "china": [china1, china2],
                "german": [german1, german2],
                "armenia": [armenia1, armenia2],
                "tatarstan": [tatarstan1, tatarstan2],
                "southKorea": [southKorea1, southKorea2]]
    }

    def createCountryHotel(country, hotel) {
        return new CountryHotel(country: country, hotel: hotel)
    }

    @Transactional
    def mainInit() {
        def countries = countriesInit()
        def hotels = hotelsInit()
        def countriesHotels = countriesHotelsInit(countries, hotels)

        hotels.each {k, v -> v.save(failOnError: true)}
        countries.each {k, v -> v.save(failOnError: true)}
        countriesHotels.each {k, v ->
            v.each {ch ->
                countries.get(k).addToHotels(ch)
                hotels.each {pair ->
                    if (pair.value == ch.hotel) {
                        pair.value.addToCountries(ch)
                    }
                }
                ch.save(failOnError: true, flush: true)
            }
        }
    }
}
