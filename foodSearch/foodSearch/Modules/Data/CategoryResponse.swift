//
//  CategoryResponse.swift
//  foodSearch
//
//  Created by Santosh Karnati on 01/09/21.
//

import Foundation

struct CategoryResponse: Decodable, Hashable {
    let categories: [Categories]
}

struct Categories: Decodable, Hashable {
    let alias: String
    let title: String
}

extension CategoryResponse {
    var foodCategory: [Categories]{ return categories.filter { cate in
        return cate.title.elementsEqual("Food") || cate.title.elementsEqual("Restaurants")
    }
    }
}
