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
    
    @ObservedObject var viewModel = ViewModel()
    
    @State private var image = Image(systemName: "person.circle.fill")
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    ZStack {
                        Circle()
                            .stroke(Color.purple, lineWidth: 4)
                        image
                            .resizable()
                            .clipShape(Circle())
                        
                    }
                    .contentShape(Circle())
                    .onTapGesture {
                        showingImagePicker = true
                    }
                    Text("Add Photo")
                }
                
                Form {
                    Section {
                        //                    TextField("First name", text: viewModel.person[id].firstName)
                        //                TextField("First name", text: viewModel.person.lastName)
                        //                TextField("First name", text: viewModel.person.company)
                        Text("sample")
                        Text("sample 222")
                    }
                }
                
                .onChange(of: inputImage) { _ in loadImage() }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $inputImage)
                }
            }
            .navigationTitle("New contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save", action: {} ) }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                       dismiss()
                    }
                }
            }
            
        }
    }
    
    
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

//struct AddContactView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddContactView()
//    }
//}
