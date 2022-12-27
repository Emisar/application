package com.test.application

class SearchController {
    private static final int START_OFFSET = 0
    private static final int DEFAULT_MAX = 2
    private static final String INDEX_VIEW_NAME = "index"

    def index() {
        return [
                model: [
                        searchField: [
                                countries: Country.list(sort: "name", order: "asc")
                        ]
                ]
        ]
    }

    def search() {
        int offset = params.offset as Integer ?: START_OFFSET
        int max = params.max as Integer ?: DEFAULT_MAX
        Long countryId = params.countryId as Long
        String searchString = params.searchString

        LinkedHashMap<String, Object> searchResult = searchHotelsByParams(offset, max, countryId, searchString)

        List<Hotel> hotels = searchResult.result
        int totalCount = searchResult.totalCount

        render(view: INDEX_VIEW_NAME, model: createModel(countryId, searchString, hotels, totalCount, offset, max))
    }

    private searchHotelsByParams(int offset, int max, Long countryId, String searchString) {
        int totalCount = Hotel.createCriteria().get() {
            projections {
                countDistinct("id")
            }
            createAlias("countries", "ch")
            createAlias("ch.country", "c")

            if (countryId != -1L) {
                like("c.id", countryId)
            }
            rlike("name", ".*${searchString}.*")
        }
        List<Object[]> resultListObjects = Hotel.createCriteria().list() {
            projections {
                distinct("id")
                property("stars")
                property("name")
                property("ch.hotel")
            }
            firstResult(offset)
            maxResults(max)
            createAlias("countries", "ch")
            createAlias("ch.country", "c")

            if (countryId != -1L) {
                like("c.id", countryId)
            }
            rlike("name", ".*${searchString}.*")
            and {
                order("stars", "desc")
                order("name", "asc")
            }
        }
        List<Hotel> resultList = parseResultListToHotelList(resultListObjects)
        return [result: resultList, totalCount: totalCount]
    }

    private static List<Hotel> parseResultListToHotelList(List<Object[]> resultList) {
        List<Hotel> hotels = []
        resultList.each { arr -> hotels.add(arr[3] as Hotel) }
        return hotels
    }

    private static createModel(long countryId, String searchString, List<Hotel> hotels, int totalCount, int offset, int max) {
        return [
                model      : [
                        searchField: [
                                countries   : Country.list(sort: "name", order: "asc"),
                                countryId   : countryId,
                                searchString: searchString
                        ],
                        resultField: [
                                hotels    : hotels,
                                totalCount: totalCount
                        ]
                ],
                searchParam: [
                        countryId   : countryId,
                        searchString: searchString
                ],
                pagination : [
                        offset    : offset,
                        max       : max,
                        totalCount: totalCount
                ]
        ]
    }
}
