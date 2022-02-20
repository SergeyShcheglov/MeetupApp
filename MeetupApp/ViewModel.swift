//
//  ContentView-ViewModel.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import Foundation

    class ContentViewModel: ObservableObject {
        @Published var person = [PersonContacts]()
        @Published var addButtonTapped = false
        
        
    }

