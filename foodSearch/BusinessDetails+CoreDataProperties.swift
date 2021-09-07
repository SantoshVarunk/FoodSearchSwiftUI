//
//  BusinessDetails+CoreDataProperties.swift
//  foodSearch
//
//  Created by Santosh Karnati on 07/09/21.
//
//

import Foundation
import CoreData


extension BusinessDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BusinessDetails> {
        return NSFetchRequest<BusinessDetails>(entityName: "BusinessDetails")
    }

    @NSManaged public var name: String?
    @NSManaged public var image_url: String?
    @NSManaged public var rating: Double
    @NSManaged public var is_closed: Bool
    @NSManaged public var businessId: String?
    @NSManaged public var location: LocationDetails?

}

extension BusinessDetails : Identifiable {

}
