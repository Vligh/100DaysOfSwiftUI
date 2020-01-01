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
    Photo(name: "A shield", image: Image(systemName: "shield")),
    Photo(name: "Clock", image: Image(systemName: "clock"))
  ].sorted()
  @State private var showingImagePicker = false
  @State private var inputImage: UIImage?

  var body: some View {
    NavigationView {
      List(photos) { photo in
        NavigationLink(destination: DetailsView(photo: photo)) {
          HStack {
            photo.image
              .resizable()
              .frame(width: 50, height: 50)
            Text(photo.name)
          }
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

    let photo = Photo(name: "Some name", image: Image(uiImage: inputImage))
    photos.append(photo)

    print("The image has been loaded: \(String(describing: photo.image))")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
