//
//  URN.swift
//  foodSearch
//
//  Created by Santosh Karnati on 01/09/21.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol URN {
    associatedtype Derived: Decodable
    var endPoint: EndPoint { get }
    var baseURLType: BaseURLType { get }
    var queryPath: String? { get }
    var method: HTTPMethod { get }
    var parameters: [String: String]? { get }
    var body: Data? { get }
    var urlQueryItems: [URLQueryItem] { get }
    var headers: [String: String]? { get }
    func getURLRequest() -> URLRequest?
}

extension URN {

    var queryPath: String? {
        return nil
    }

    var urlQueryItems: [URLQueryItem] {
        var queryItems: [URLQueryItem] = []
        if let parameters = parameters {
            for eachQueryParam in parameters {
                queryItems.append(URLQueryItem(name: eachQueryParam.key, value: eachQueryParam.value))
            }
        }
        return queryItems
    }

    func getURLRequest() -> URLRequest? {
        var urlComponents = URLComponents(string: baseURLType.baseURLString + endPoint.rawValue)
        if let queryItems = urlComponents?.queryItems,
           queryItems.isEmpty == false {
            //Do nothing
        } else {
            urlComponents?.queryItems = urlQueryItems
        }
        if let queryPath = queryPath {
            urlComponents?.path.append("/" + queryPath)
        }
        guard let url = urlComponents?.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        let authHeaders = ["Authorization": "Bearer pVsDVsr01tInNWBJAzOVdpHXLziseRLVKuGw-FejC9RriegZt16nCOOg2_LJgw8fpaIarBcHbLKb80w4PGfr9imQTqI_mvLDWSWtqYlaIOquvzEt4Uxh5sq_Hfo0YXYx"]
        if let headers = headers {
            request.allHTTPHeaderFields = headers.merging(authHeaders, uniquingKeysWith: { $1 })
        } else {
            request.allHTTPHeaderFields = authHeaders
        }
        return request
    }
}

protocol ContentURN: URN {}
extension ContentURN {

    var baseURLType: BaseURLType {
        return .content
    }

    var method: HTTPMethod {
        return .get
    }

    var body: Data? {
        return nil
    }
    
    var headers: [String : String]? {
        switch method {
        case .post, .put, .delete, .get:
            return [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
    }

    var parameters: [String: String]? {
        return nil
    }
}

struct SearchURN: ContentURN {
    typealias Derived = SearchResponse
    
    var endPoint: EndPoint {
        return .getSearchResults
    }
    
    var method: HTTPMethod { return .get }
    
    var parameters: [String : String]?
}

struct CategoryURN: ContentURN {
    
    typealias Derived = CategoryResponse
    
    var endPoint: EndPoint {
        return .getCategories
    }
    
    var method: HTTPMethod { return .get }
}

struct BusinessDetailsURN: ContentURN {
    typealias Derived = BusinessDetailsResponse
    
    var endPoint: EndPoint {
        return .getContent(id)
    }
    
    var method: HTTPMethod { return .get }
    
    var parameters: [String : String]?
    
    var id: String
}
