//
//  ContentView.swift
//  Instafilter
//
//  Created by Vitali Tatarintev on 24.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

class ImageSaver: NSObject {
  func writeToPhotoAlbum(image: UIImage) {
    UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
  }

  @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
    print("Save finished!")
  }
}

struct ContentView: View {
  @State private var image: Image?
  @State private var showingImagePicker = false
  @State private var inputImage: UIImage?

  var body: some View {
    VStack {
      image?
        .resizable()
        .scaledToFit()

      Button("Select Image") {
        self.showingImagePicker = true
      }
    }
    .sheet(isPresented: $showingImagePicker) {
      ImagePicker(image: self.$inputImage, onDismiss: self.loadImage)
    }
  }

  func loadImage() {
    guard let inputImage = inputImage else { return }
    image = Image(uiImage: inputImage)

    let imageSaver = ImageSaver()
    imageSaver.writeToPhotoAlbum(image: inputImage)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
