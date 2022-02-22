//
//  DataController.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 20.02.2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ContactsModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("CoreData failed to load due to: \(error.localizedDescription)")
            }
        }
    }
}
