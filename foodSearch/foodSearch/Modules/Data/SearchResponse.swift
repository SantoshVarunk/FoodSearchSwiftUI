//
//  SearchResponse.swift
//  foodSearch
//
//  Created by Santosh Karnati on 01/09/21.
//

import Foundation

struct SearchResponse: Decodable {
    let businesses: [Business]
    let total: Int?
}

struct Business: Decodable, Hashable {
    let rating: Double?
    let price: String?
    let name: String
    let is_closed: Bool?
    let url: String?
    let id: String
    let image_url: String?
    let location: Location?
}

struct Location: Decodable, Hashable {
    let city: String?
    let country: String?
    let state: String?
    let address1: String?
    let zip_code: String?
}

extension SearchResponse {
    var nearByRestaurants: [Business] {
        if(businesses.count > 2){
            return Array(businesses[0...1] )
        }
        else {
            return businesses
        }
    }
}
