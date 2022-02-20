//
//  PersonContacts.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import Foundation

struct PersonContacts: Identifiable {
    let id: UUID
    var firstName: String
    var lastName: String
    var company: String?
    
    var photo: String?
}
