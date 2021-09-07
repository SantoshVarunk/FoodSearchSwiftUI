//
//  LocationDetails+CoreDataProperties.swift
//  foodSearch
//
//  Created by Santosh Karnati on 07/09/21.
//
//

import Foundation
import CoreData


extension LocationDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocationDetails> {
        return NSFetchRequest<LocationDetails>(entityName: "LocationDetails")
    }

    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var address1: String?
    @NSManaged public var state: String?
    @NSManaged public var name: String?
    @NSManaged public var zip_code: String?
    @NSManaged public var businessDetails: BusinessDetails?

}

extension LocationDetails : Identifiable {

}
