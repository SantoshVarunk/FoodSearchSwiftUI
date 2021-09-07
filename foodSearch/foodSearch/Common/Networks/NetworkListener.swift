//
//  NetworkListener.swift
//  foodSearch
//
//  Created by Santosh Karnati on 01/09/21.
//

import Foundation
import Network

final class NetworkListener: ObservableObject, Dispatchable {

    static let shared = NetworkListener()

    @Published private(set) var isConnected = true
    private let networkMonitor = NWPathMonitor()

    func setup() {
        networkMonitor.pathUpdateHandler = { [weak self] path in
            self?.performTaskOnMainThread {
                self?.isConnected = path.status == .satisfied
            }
        }
        let queue = DispatchQueue(label: "NetworkListener.Monitor")
        networkMonitor.start(queue: queue)
    }
}
