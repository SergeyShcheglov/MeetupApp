//
//  ContentView-ViewModel.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var person = [PersonContacts]()
    
    @Published var addButtonTapped = false
    @Published var showingImagePicker = false
    
}

