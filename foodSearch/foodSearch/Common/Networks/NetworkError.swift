//
//  NetworkError.swift
//  foodSearch
//
//  Created by Santosh Karnati on 01/09/21.
//

import Foundation
enum NetworkError: Error {
    case responseNotFound
    case networkOffline
    case unknownStatusCode
    case authTokenNotValid
    case requestFailed(statusCode: Int, errorMessage: String?)
    case urnDataMissing(endpoint: String)
    case responseDecodingFailed(url: String?, error: Error)
    case badRequestBody
    case encodingFailed

    var description: String {
        switch self {
        case .networkOffline:
            return "Offline"
        case .requestFailed( _, let errorMessage):
            if let errorMessage = errorMessage, !errorMessage.isEmpty {
                return errorMessage
            } else {
                return "DefaultMessage"
            }
        case .responseDecodingFailed( _, _):
            return "DecodingFailed"
        case .encodingFailed:
            return "EncodingFailed"
        default:
            return "DefaultMessage"
        }
    }
}
