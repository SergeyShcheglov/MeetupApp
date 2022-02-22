//
//  DetailView.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import SwiftUI

struct DetailView: View {
    var contact: ContactsModel
    
    let savePaths = FileManager.documentDirectory
    
    var body: some View {
        VStack {
            getPhotoFrom(uuid: contact.wrappedPhotoId)
                .resizable()
                .frame(maxHeight: UIScreen.main.bounds.height * 0.6)
            Text("\(contact.firstName ?? "") \(contact.lastName ?? "")")
            Spacer()
        }
    }
    func getPhotoFrom(uuid: UUID) -> Image {
        let uuidString = uuid.uuidString
        guard let data = try? Data(contentsOf: savePaths.appendingPathComponent(uuidString)) else { return Image(systemName: "person.crop.circle.badge.questionmark") }
        guard let uiImage = UIImage(data: data, scale: 1.0) else { return Image(systemName: "person.crop.circle") }
        return Image(uiImage: uiImage)
    }
    
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
