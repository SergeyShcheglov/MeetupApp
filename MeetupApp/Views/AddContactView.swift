//
//  AddContactView.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import SwiftUI
import PhotosUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var context
    
    @ObservedObject var vm = ViewModel()
    
    @State private var image = Image(systemName: "person.circle.fill")
    @State private var inputImage: UIImage?
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var company = ""
    @State private var notes = ""
    
    let savePaths = FileManager.documentDirectory
        
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    ZStack {
                        Circle()
                            .stroke(Color.purple, lineWidth: 4)
                        
                        image
                            .resizable()
//                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .clipShape(Circle())
                    }
                    .contentShape(Circle())
                    .onTapGesture {
                        vm.source = .camera
                        vm.showPhotoPicker()
                    }
                    Text("Add Photo")
                }
                
                Form {
                    Section {
                        TextField("First name", text: $firstName)
                        TextField("Last name", text: $lastName)
                    }
                    
                    Section {
                        TextField("Company", text: $company)
                        TextField("Some notes", text: $notes)
                            .frame(height: 100)
                    }
                }
                .alert("Error", isPresented: $vm.showCameraAlert) {
                    vm.cameraError?.buttonOK
                    vm.cameraError?.buttonSettings
                } message: {
                    Text(vm.cameraError?.message ?? "")
                }
                .sheet(isPresented: $vm.showingImagePicker) {
                    ImagePicker(image: $inputImage)
                        .ignoresSafeArea()
                        .onAppear {
                            locationFetcher.start()
                        }
                }
                .onChange(of: inputImage) { _ in loadImage() }

            }
            .navigationTitle("New contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save", action: { saveContact() } )
                        .disabled(firstName == "" && lastName == "" ? true : false)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            
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
        dismiss()
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
