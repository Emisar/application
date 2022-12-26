package com.test.application

class CountryHotel {
    Country country
    Hotel hotel

    static belongsTo = [Country, Hotel]

    static constraints = {
    }
}
