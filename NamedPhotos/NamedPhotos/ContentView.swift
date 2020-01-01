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
  @State private var image: Image?
  @State private var showingAddImageScreen = false

  var body: some View {
    NavigationView {
      List {
        ForEach(photos) { photo in
          NavigationLink(destination: DetailsView(photo: photo)) {
            HStack {
              photo.image
                .resizable()
                .frame(width: 50, height: 50)
              Text(photo.name)
            }
          }
        }
        .onDelete(perform: deletePhotos)
      }
      .navigationBarTitle("Named Photos")
      .navigationBarItems(trailing: Button(action: {
        self.showingImagePicker = true
      }) {
        Image(systemName: "plus")
      })
      .sheet(isPresented: $showingAddImageScreen) {
        AddPhotoView(photo: self.image!, onSuccess: self.addPhoto)
      }
    }
    .sheet(isPresented: $showingImagePicker) {
      ImagePicker(image: self.$inputImage, onDismiss: self.loadImage)
    }
  }

  func deletePhotos(at offsets: IndexSet) {
    photos.remove(atOffsets: offsets)
  }

  func loadImage() {
    guard let inputImage = inputImage else { return }

    image = Image(uiImage: inputImage)

    self.showingAddImageScreen = true
  }

  func addPhoto(_ name: String) {
    let photo = Photo(name: name, image: self.image!)
    photos.append(photo)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
