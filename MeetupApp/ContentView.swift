//
//  ContentView.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var contentViewModel = ViewModel()
    
    
    var body: some View {
        NavigationView {
            NavigationLink {
                DetailView()
            } label: {
                List(contentViewModel.person, id: \.id) { person in
                    HStack {
                        Image(person.photo ?? "person.circle")
                        
                        VStack(alignment: .leading) {
                            Text("\(person.firstName) \(person.lastName)")
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
