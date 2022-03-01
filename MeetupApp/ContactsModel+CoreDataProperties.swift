//
//  ContactsModel+CoreDataProperties.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 01.03.2022.
//
//

import Foundation
import CoreData


extension ContactsModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactsModel> {
        return NSFetchRequest<ContactsModel>(entityName: "ContactsModel")
    }

    @NSManaged public var company: String?
    @NSManaged public var dateAdded: Date?
    @NSManaged public var firstName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var lastName: String?
    @NSManaged public var notes: String?
    @NSManaged public var photo: UUID?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

    public var wrappedFirstName: String {
        firstName ?? "Unknown Name"
    }

    public var wrappedPhotoId: UUID {
        photo ?? UUID()
    }
}

extension ContactsModel : Identifiable {

}
