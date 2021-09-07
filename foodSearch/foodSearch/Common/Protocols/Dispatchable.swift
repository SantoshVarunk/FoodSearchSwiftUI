//
//  Dispatchable.swift
//  foodSearch
//
//  Created by Santosh Karnati on 01/09/21.
//

import Foundation
protocol Dispatchable {
    func performTaskOnGlobalQueue(_ qos: DispatchQoS.QoSClass, _ task: @escaping ()->())
    func performTaskOnMainThread(_ task: @escaping ()->())
    func performTaskAfterDelay(_ delay: Double, task: @escaping ()->())
}

extension Dispatchable {
    func performTaskOnGlobalQueue(_ qos: DispatchQoS.QoSClass = .default, _ task: @escaping ()->()) {
        DispatchQueue.global(qos: qos).async(execute: task)
    }

    func performTaskOnMainThread(_ task: @escaping ()->()) {
        DispatchQueue.main.async(execute: task)
    }

    func performTaskAfterDelay(_ delay: Double, task: @escaping ()->()) {
        let delay = delay * Double(NSEC_PER_SEC)
        let time = DispatchTime.now() + Double(Int64(delay)) /  Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: task)
    }
}
