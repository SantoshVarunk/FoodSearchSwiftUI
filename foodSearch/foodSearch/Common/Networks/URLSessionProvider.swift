//
//  URLSessionProvider.swift
//  foodSearch
//
//  Created by Santosh Karnati on 01/09/21.
//

import Foundation
import Combine

struct URLSessionProvider: NetworkServiceProvider {
    typealias URNType = URN
    
    func execute<URNType>(with urnType: URNType,
                          completionHandler: @escaping (Result<URNType.Derived, NetworkError>) -> Void)where URNType : URN {
        guard let request = urnType.getURLRequest() else {
            return
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request){(data, response, error) in
            if let data = data {
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    let httpResponse = response
                    let statusCode = httpResponse.statusCode
                    if statusCode == 200 {
                        self.processJSON(responseData: data,
                                         completion: completionHandler)
                    } else if statusCode == 410 {
                        completionHandler(.failure(.unknownStatusCode))
                    } else if statusCode == 404 {
                        completionHandler(.failure(.badRequestBody))
                    } else {
                        completionHandler(.failure(.unknownStatusCode))
                    }
                } else {
                    completionHandler(.failure(.networkOffline))
                }
            }
        }
        task.resume()
    }
    
    private func processJSON<T: Decodable>(responseData: Data,
                                           completion: @escaping(Result<T, NetworkError>)->()) {
        let decoder = JSONDecoder()
        do {
            let derivedModel =  try decoder.decode(T.self, from: responseData)
            completion(.success(derivedModel))
        }catch {
            print(error)
            completion(.failure(.encodingFailed))
            assertionFailure("Unknown server response")
        }
    }
}

private extension URLSessionProvider {
    func validateResponse(for response: URLResponse, data: Data) throws {
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.responseNotFound
        }
        
        switch response.statusCode {
        case 200, 201:
            break
        case 202...500:
            do {
                throw NetworkError.requestFailed(statusCode: response.statusCode, errorMessage: "request failed")
            } catch {
                throw error
            }
        default:
            throw NetworkError.unknownStatusCode
        }
    }
}
