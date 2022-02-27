//
//  DetailView.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import SwiftUI
import LocalAuthentication
import MapKit

struct DetailView: View {
    var contact: ContactsModel
    let locationFetcher = LocationFetcher()
    
    let savePaths = FileManager.documentDirectory
    
    var body: some View {
        VStack {
            getPhotoFrom(uuid: contact.wrappedPhotoId)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: UIScreen.main.bounds.height * 0.6)
            Text("\(contact.firstName ?? "") \(contact.lastName ?? "")")
            Spacer()
            
//            Map() { location in
//                MapAnnotation(coordinate: locationFetcher.lastKnownLocation? ?? CLLocationCoordinate2D(latitude: -51, longitude: -2)) {
//                    VStack {
//                        Image(systemName: "star.circle")
//                            .resizable()
//                            .foregroundColor(.red)
//                            .frame(width: 44, height: 44)
//
//                    }
//                }
//            }
        }
    }
    func getPhotoFrom(uuid: UUID) -> Image {
        let uuidString = uuid.uuidString
        guard let data = try? Data(contentsOf: savePaths.appendingPathComponent(uuidString)) else { return Image(systemName: "person.crop.circle.badge.questionmark") }
        guard let uiImage = UIImage(data: data, scale: 1.0) else { return Image(systemName: "person.crop.circle") }
        return Image(uiImage: uiImage)
    }
    
}

struct DetailView_Previews: PreviewProvider {
    static let example = ContactsModel()
    static var previews: some View {
        DetailView(contact: example)
    }
}
