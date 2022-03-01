//
//  PersonContacts.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import Foundation
import CoreLocation

struct PersonContacts: Identifiable {
    let id: UUID
    var firstName: String?
    var lastName: String?
    var company: String?
    var notes: String?
    
    let latitude: Double
    let longitude: Double
    
    var photo: String?
}
