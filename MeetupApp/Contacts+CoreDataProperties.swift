//
//  Contacts+CoreDataProperties.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 20.02.2022.
//
//

import Foundation
import CoreData


extension Contacts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contacts> {
        return NSFetchRequest<Contacts>(entityName: "Contacts")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var company: String?
    @NSManaged public var notes: String?
    @NSManaged public var photo: Data?
    @NSManaged public var dateAdded: Date?

}

extension Contacts : Identifiable {

}
