//
//  ContactsModel+CoreDataProperties.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 21.02.2022.
//
//

import Foundation
import CoreData


extension ContactsModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactsModel> {
        return NSFetchRequest<ContactsModel>(entityName: "ContactsModel")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var id: UUID?
    @NSManaged public var photo: UUID?
    @NSManaged public var dateAdded: Date?
    @NSManaged public var company: String?
    @NSManaged public var notes: String?

    public var wrappedPhotoId: UUID {
        photo ?? UUID()
    }
}

extension ContactsModel : Identifiable {

}
