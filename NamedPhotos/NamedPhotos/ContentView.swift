//
//  ContentView.swift
//  NamedPhotos
//
//  Created by Vitali Tatarintev on 31.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var photos: [Photo] = [
    Photo(name: "The forest"),
    Photo(name: "At night"),
    Photo(name: "At the beach")
  ]

  var body: some View {
    NavigationView {
      List(photos, id: \.self.name) { photo in
        NavigationLink(destination: DetailsView(photo: photo)) {
          Text(photo.name)
        }
      }
      .navigationBarTitle("Named Photos")
      .navigationBarItems(trailing: Button(action: {
        // add new photo
      }) {
        Image(systemName: "plus")
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
