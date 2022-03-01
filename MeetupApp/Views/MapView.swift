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
    
    //moscow latitude = 55.57, longitude = 37.61
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.57, longitude: 37.61), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
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

                        Text("some text")
                            .fixedSize()
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
            
        }
    }
}
