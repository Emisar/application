package com.test.application

class Hotel {
    String name
    Integer stars
    String link = ''

    static hasMany = [countries: CountryHotel]

    static constraints = {
        name blank: false, unique: true, size: 1..255
        stars blank: false, min: 1, max: 5
        link nullable: true, blank: true
    }

    String toString() {
        return name
    }
}
