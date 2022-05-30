//
//  Contact+CoreDataProperties.swift
//  SpotShare
//
//  Created by calmkeen on 2022/05/30.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: Data?

}

extension Contact : Identifiable {

}
