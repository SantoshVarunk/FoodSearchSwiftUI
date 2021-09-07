//
//  EndPoints.swift
//  foodSearch
//
//  Created by Santosh Karnati on 01/09/21.
//

import Foundation

enum EndPoint {
    
    case getContent(_ id: String)
    case getSearchResults
    case getCategories
    
    var rawValue: String {
        switch self {
        case .getContent(let id):
            return "/v3/businesses/\(id)"
        case.getSearchResults:
            return  "/v3/businesses/search"
        case .getCategories:
            return "/v3/categories"
        }
    }
}
