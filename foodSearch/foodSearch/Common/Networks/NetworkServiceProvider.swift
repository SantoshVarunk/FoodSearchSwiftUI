//
//  NetworkServiceProvider.swift
//  foodSearch
//
//  Created by Santosh Karnati on 01/09/21.
//

import Foundation
import Combine

protocol NetworkServiceProvider {
    associatedtype URNType

    func execute<URNType: URN>(with urnType: URNType,
                               completionHandler: @escaping (Result<URNType.Derived, NetworkError>) -> Void)
}
