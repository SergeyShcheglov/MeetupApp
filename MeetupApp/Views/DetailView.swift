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
    @ObservedObject var vm = ViewModel()

    var contact: ContactsModel
    let locationFetcher = LocationFetcher()
        
    var body: some View {
        VStack {
            vm.getPhotoFrom(uuid: contact.wrappedPhotoId)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: UIScreen.main.bounds.height * 0.6)
            Text("\(contact.firstName ?? "") \(contact.lastName ?? "")")
            Spacer()
            
            MapView(personContact: contact)
                .padding()
            }
    }
}
//
//struct DetailView_Previews: PreviewProvider {
//    static let example = ContactsModel()
//    static var previews: some View {
//        DetailView(contact: example)
//    }
//}
