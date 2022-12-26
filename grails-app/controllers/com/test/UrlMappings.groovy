package com.test

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "500"(view:'/error')
        "404"(view:'/notFound')

        "/" {
            view = "/search/index"
            controller = "search"
            action = "index"
        }
        "/search/index" {
            controller = "search"
            action = "index"
        }
        "/search/search" {
            controller = "search"
            action = "search"
        }

        "/country/list" {
            controller = "country"
            action = "list"
        }
        "/country/create" {
            controller = "country"
            action = "create"
        }
        "/country/edit" {
            controller = "country"
            action = "edit"
        }
        "/country/delete" {
            controller = "country"
            action = "delete"
        }

        "/hotel/list" {
            controller = "hotel"
            action = "list"
        }
        "/hotel/create" {
            controller = "hotel"
            action = "create"
        }
        "/hotel/edit" {
            controller = "hotel"
            action = "edit"
        }
        "/hotel/delete" {
            controller = "hotel"
            action = "delete"
        }
    }
}
