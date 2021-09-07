//
//  BusinessDetails+CoreDataClass.swift
//  foodSearch
//
//  Created by Santosh Karnati on 07/09/21.
//
//

import Foundation
import CoreData

@objc(BusinessDetails)
public class BusinessDetails: NSManagedObject {

}

extension BusinessDetails {
    func toViewData() -> BusinessDetailsResponse {
        return BusinessDetailsResponse(model: self)
    }
}

