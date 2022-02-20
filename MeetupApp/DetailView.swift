//
//  DetailView.swift
//  MeetupApp
//
//  Created by Sergey Shcheglov on 18.02.2022.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var contentViewModel = ViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "heart")
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
