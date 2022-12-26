package com.test.application

class SearchController {

    def index() {
        def result = [countries: Country.list(sort: "name", order: "asc")]
        if (params != null) {
            if (params.fromSearch) {
                result.emptySearchResult = true
            }
            if (params.pageHotelsId && params.offset && params.totalHotelsId && params.totalResults) {
                result.emptySearchResult = false
                def hotels = []
                params.pageHotelsId.each { hotels.add(Hotel.get(it)) }
                result.searchResult = [hotels: hotels]
                result.pagination = [offset: params.offset, totalHotelsId: params.totalHotelsId, totalResults: params.totalResults]
            }
        }

        return result
    }

    def pagination() {
        def hotelsId = params.hotelsId as List
        def offset = params.offset as Integer
        def max = params.max as Integer
        def totalResults = params.totalResults as Integer

        def startFrom = offset
        def end = Math.min(startFrom + max, hotelsId.size())
        def result = hotelsId.subList(startFrom, end)

        redirect(action: "index", params: [pageHotelsId: result, offset: offset, totalHotelsId: hotelsId, totalResults: totalResults])
    }

    def search() {
        def countryId = params.country as Integer
        def searchString = params.search
        def result = Hotel.list(sort: "stars", order: "desc")
        if (countryId != -1) {
            def country = Country.get(countryId)
            result = result.findAll { it.countries.find { it.country == country } != null }
        }
        if (searchString != "") {
            result = result.findAll { it.name.toLowerCase().indexOf(searchString.toLowerCase()) != -1 }
        }
        if (result.size() == 0) {
            redirect(action: "index", params: [fromSearch: true])
        } else {
            redirect(action: "pagination", params: [offset: 0, max: 2, hotelsId: result*.id, totalResults: result.size()])
        }
    }
}
