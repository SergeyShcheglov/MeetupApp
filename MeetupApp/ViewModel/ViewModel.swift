//
//  ContentView-ViewModel.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import SwiftUI
import MapKit

class ViewModel: ObservableObject {
    @Published var person = [PersonContacts]()
    
    @Published var addButtonTapped = false
    @Published var source: Picker.Source = .library
    @Published var showingImagePicker = false
    @Published var showCameraAlert = false
    @Published var cameraError: Picker.CameraErrorType?
    let savePaths = FileManager.documentDirectory
    
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
    
    func getPhotoFrom(uuid: UUID) -> Image {
        let uuidString = uuid.uuidString
        guard let data = try? Data(contentsOf: savePaths.appendingPathComponent(uuidString)) else { return Image(systemName: "person.crop.circle.badge.questionmark") }
        guard let uiImage = UIImage(data: data, scale: 1.0) else { return Image(systemName: "person.crop.circle") }
        return Image(uiImage: uiImage)
    }
}

