//
//  BaseURLType.swift
//  foodSearch
//
//  Created by Santosh Karnati on 01/09/21.
//

import Foundation

enum BaseURLType {
    
    case content

    var baseURLString: String {
        switch self {
        case .content:
            do {
                let url: String = try Configuration.value(for: .CONTENT_API_BASE_URL)
                return url
            } catch {
                assertionFailure(error.localizedDescription)
                return ""
            }
        }
    }
}
