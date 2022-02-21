//
//  MeetupAppApp.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import SwiftUI

@main
struct MeetupAppApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
