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
  @State private var showingImagePicker = false
  @State private var inputImage: UIImage?
  @State private var image: Image?

  var body: some View {
    NavigationView {
      List(photos, id: \.self.name) { photo in
        NavigationLink(destination: DetailsView(photo: photo)) {
          Text(photo.name)
        }
      }
      .navigationBarTitle("Named Photos")
      .navigationBarItems(trailing: Button(action: {
        self.showingImagePicker = true
      }) {
        Image(systemName: "plus")
      })
    }
    .sheet(isPresented: $showingImagePicker) {
      ImagePicker(image: self.$inputImage, onDismiss: self.loadImage)
    }
  }

  func loadImage() {
    guard let inputImage = inputImage else { return }
    image = Image(uiImage: inputImage)

    print("The image has been loaded: \(String(describing: image))")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
