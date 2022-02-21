//
//  ContentView.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var contentViewModel = ViewModel()
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.dateAdded)]) var contacts: FetchedResults<Contacts>
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        NavigationView {
            NavigationLink {
                DetailView()
            } label: {
                List(contacts, id: \.id) { contact in
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.1)
                        
                        VStack(alignment: .leading) {
                            Text(contact.firstName ?? "noname")
                            + Text(" ")
                            + Text(contact.lastName ?? "")
                            Text("some descritpion")
                        }
                    }
                }
            }
            .navigationTitle("MeetupApp")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        contentViewModel.addButtonTapped = true},
                           label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $contentViewModel.addButtonTapped) {
                AddContactView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
