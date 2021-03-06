//
//  MapView.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 01.03.2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    var personContact: ContactsModel
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 54.99, longitude: 73.36), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion, annotationItems: [personContact]) { person in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: person.latitude, longitude: person.longitude)) {
                    VStack {
                        Image(systemName: "circle")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(Circle())

                        Text("You've met here")
                            .fixedSize()
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
        }
    }
}
