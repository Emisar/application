package com.test.application

class Country {
    String name
    String capital

    static hasMany = [hotels: CountryHotel]

    static constraints = {
        name nullable: false, blank: false, unique: true, size: 1..255
        capital nullable: false, blank: false, size: 1..128
    }

    String toString() {
        return name
    }
}
