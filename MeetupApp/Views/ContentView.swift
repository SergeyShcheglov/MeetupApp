//
//  ContentView.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var contentViewModel = ContentViewModel()
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.dateAdded)]) var contacts: FetchedResults<ContactsModel>
    @Environment(\.managedObjectContext) var context
    
    let savePaths = FileManager.documentDirectory
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts, id: \.id) { contact in
                    NavigationLink {
                        DetailView(contact: contact)
                    } label: {
                        HStack {
                            getPhotoFrom(uuid: contact.wrappedPhotoId)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .clipped()
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(contact.firstName ?? "noname")
                                + Text(" ")
                                + Text(contact.lastName ?? "")
                                Text("some descritpion")
                            }
                            
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
    func getPhotoFrom(uuid: UUID) -> Image {
        let uuidString = uuid.uuidString
        guard let data = try? Data(contentsOf: savePaths.appendingPathComponent(uuidString)) else { return Image(systemName: "person.crop.circle.badge.questionmark") }
        guard let uiImage = UIImage(data: data, scale: 1.0) else { return Image(systemName: "person.crop.circle") }
        return Image(uiImage: uiImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
