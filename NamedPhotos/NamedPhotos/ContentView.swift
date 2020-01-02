//
//  ContentView.swift
//  NamedPhotos
//
//  Created by Vitali Tatarintev on 31.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var photos: [Photo] = []
  @State private var showingImagePicker = false
  @State private var inputImage: UIImage?
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
        AddPhotoView(photo: Image(uiImage: self.inputImage!), onSuccess: self.addPhoto)
      }
    }
    .onAppear(perform: loadData)
    .sheet(isPresented: $showingImagePicker) {
      ImagePicker(image: self.$inputImage, onDismiss: self.loadImage)
    }
  }

  func deletePhotos(at offsets: IndexSet) {
    photos.remove(atOffsets: offsets)
    saveData()
  }

  func loadImage() {
    guard inputImage != nil else { return }

    self.showingAddImageScreen = true
  }

  func addPhoto(_ name: String) {
    let photo = Photo(name: name, uiImage: self.inputImage!)
    photos.append(photo)
    saveData()
  }

  func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }

  func saveData() {
    do {
      let filename = getDocumentsDirectory().appendingPathComponent("NamedPictures")
      let data = try JSONEncoder().encode(self.photos)
      try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
    } catch {
      print("Unable to save data.")
    }
  }

  func loadData() {
    let filename = getDocumentsDirectory().appendingPathComponent("NamedPictures")

    do {
      let data = try Data(contentsOf: filename)
      photos = try JSONDecoder().decode([Photo].self, from: data)
    } catch {
      print("Unable to load saved data.")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
