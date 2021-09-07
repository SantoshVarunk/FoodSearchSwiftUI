//
//  ContentService.swift
//  foodSearch
//
//  Created by Santosh Karnati on 04/09/21.
//

import Foundation
import Combine

class ContentService<T: NetworkServiceProvider> {
    
    var serviceProvider: T
    
    init(with serviceProvider: T) {
        self.serviceProvider = serviceProvider
    }
    
    func getAllCategory(completion: @escaping (Result<CategoryResponse, NetworkError>) -> Void) {
        return serviceProvider.execute(with: CategoryURN(), completionHandler: completion)
    }
    
    func getBusinessBySearchText(parameter: [String : String], completion: @escaping (Result<SearchResponse, NetworkError>) -> Void) {
        return serviceProvider.execute(with: SearchURN(parameters:parameter), completionHandler: completion)
    }
    
    func getNearByRestaurants(parameter: [String : String],completion: @escaping (Result<SearchResponse, NetworkError>) -> Void) {
        return serviceProvider.execute(with: SearchURN(parameters:parameter), completionHandler: completion)
    }
    
    func getBusinessDetails(id: String,completion: @escaping (Result<BusinessDetailsResponse, NetworkError>) -> Void) {
        return serviceProvider.execute(with: BusinessDetailsURN(id:id), completionHandler: completion)
    }
}
