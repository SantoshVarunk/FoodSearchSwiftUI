//
//  ContentManager.swift
//  foodSearch
//
//  Created by Santosh Karnati on 04/09/21.
//

import Foundation
import Combine

struct ContentManager {
    
    var contentService: ContentService = ContentService(with: URLSessionProvider())
    
    func getAllCategory(completion: @escaping (Result<CategoryResponse, NetworkError>) -> Void) {
        return contentService.getAllCategory(completion: completion)
    }
    
    func getNearByRestaurants(completion: @escaping (Result<SearchResponse, NetworkError>) -> Void) {
        return contentService.getNearByRestaurants(parameter: getNearByRestaurantsParameter(), completion: completion)
    }
    
    func getBusinessBySearchText(text: String,category: String, completion: @escaping (Result<SearchResponse, NetworkError>) -> Void) {
        return contentService.getBusinessBySearchText(parameter: getBusinessBySearchTextParameter(text: text, category: category), completion: completion)
    }
    
    func getBusinessDetails(id: String, completion: @escaping (Result<BusinessDetailsResponse, NetworkError>) -> Void) {
        return contentService.getBusinessDetails(id: id, completion: completion)
    }
    
    private func getNearByRestaurantsParameter() -> [String : String] {
        let parameter = NSMutableDictionary()
        parameter["location"] = "New York City"
        parameter["categories"] = "restaurants"
        return parameter as! [String : String]
    }
    
    private func getBusinessBySearchTextParameter(text: String,category: String) -> [String : String] {
        let parameter = NSMutableDictionary()
        parameter["term"] = text
        parameter["location"] = "New York City"
        parameter["categories"] = category.replacingOccurrences(of: " ", with: "").lowercased()
        return parameter as! [String : String]
    }
}

