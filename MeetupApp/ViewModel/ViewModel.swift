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
    @Published var source: Picker.Source = .library
    @Published var showingImagePicker = false
    @Published var showCameraAlert = false
    @Published var cameraError: Picker.CameraErrorType?
    
    func showPhotoPicker() {
        do {
            if source == .camera {
                try Picker.checkPermissions()
            }
            showingImagePicker = true
        } catch {
            showCameraAlert = true
            cameraError = Picker.CameraErrorType(error: error as! Picker.PickerError)
        }
    }
}

