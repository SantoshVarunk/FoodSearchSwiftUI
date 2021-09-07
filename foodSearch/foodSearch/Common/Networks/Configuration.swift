//
//  Configuration.swift
//  foodSearch
//
//  Created by Santosh Karnati on 01/09/21.
//

import Foundation

struct Configuration {
    static func value<T>(for key: Key) throws -> T where T: LosslessStringConvertible {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue) else {
            throw Error.missingKey
        }

        switch value {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else {
                fallthrough
            }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

extension Configuration {

    enum Key: String {
        case CONTENT_API_BASE_URL
    }
}

extension Configuration {

    enum Error: Swift.Error {
        case missingKey
        case invalidValue
    }
}
