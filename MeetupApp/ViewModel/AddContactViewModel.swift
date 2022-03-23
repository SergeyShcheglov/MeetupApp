//
//  AddContactViewModel.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 23.03.2022.
//

import SwiftUI

class AddContactViewModel: ObservableObject {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var context
    
    @Published var image = Image(systemName: "person.circle.fill")
    @Published var inputImage: UIImage?
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var company = ""
    @Published var notes = ""
    
    let locationFetcher = LocationFetcher()
    let savePaths = FileManager.documentDirectory
    
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
    
    func loadImage() {
            guard let inputImage = inputImage else { return }
            image = Image(uiImage: inputImage)
        }
    
    func saveContact() {
        let uuid = UUID()
        
        let newContact = ContactsModel(context: context)
        newContact.id = UUID()
        newContact.firstName = firstName
        newContact.lastName = lastName
        newContact.company = company
        newContact.notes = notes
        newContact.dateAdded = Date.now
        newContact.photo = uuid
        
        newContact.latitude = locationFetcher.lastKnownLocation?.latitude ?? 23.3
        newContact.longitude = locationFetcher.lastKnownLocation?.longitude ?? 34.1
        
        do {
            if let jpegData = inputImage?.jpegData(compressionQuality: 0.8) {
                try? jpegData.write(to: savePaths.appendingPathComponent(uuid.uuidString), options: [.atomic, .completeFileProtection])
            } else {
                print("couldn't save to docs")
            }
            try context.save()
        } catch {
            print("Couldn't save to CoreData: \(error.localizedDescription)")
        }
//        dismiss()
    }
}
