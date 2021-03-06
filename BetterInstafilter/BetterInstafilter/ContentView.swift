//
//  ContentView.swift
//  BetterInstafilter
//
//  Created by Vitali Tatarintev on 25.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
  @State private var image: Image?
  @State private var filterIntensity = 0.5
  @State private var currentFilterName = "No filter"

  @State private var showingFilterSheet = false
  @State private var showingImagePicker = false
  @State private var showingSaveError = false
  @State private var inputImage: UIImage?
  @State private var processedImage: UIImage?

  @State var currentFilter: CIFilter = CIFilter.sepiaTone()
  let context = CIContext()

  var body: some View {
    let intensity = Binding<Double>(
      get: {
        self.filterIntensity
      },
      set: {
        self.filterIntensity = $0
        self.applyProcessing()
      }
    )

    return NavigationView {
      VStack {
        ZStack {
          Rectangle()
            .fill(Color.secondary)

          if image != nil {
            image?
              .resizable()
              .scaledToFit()
          } else {
            Text("Tap to select a picture")
              .foregroundColor(.white)
              .font(.headline)
          }
        }
        .onTapGesture {
          self.showingImagePicker = true
        }

        HStack {
          Text(currentFilterName)
            .font(.subheadline)
        }

        HStack {
          Text("Intensity")
          Slider(value: intensity)
        }
        .padding(.vertical)

        HStack {
          Button("Change Filter") {
            self.showingFilterSheet = true
          }

          Spacer()

          Button("Save") {
            guard let processedImage = self.processedImage else {
              self.showingSaveError = true
              return
            }

            let imageSaver = ImageSaver()

            imageSaver.successHandler = {
              print("Success!")
            }

            imageSaver.errorHandler = {
              print("Oops: \($0.localizedDescription)")
            }

            imageSaver.writeToPhotoAlbum(image: processedImage)
          }
        }
      }
      .padding([.leading, .bottom, .trailing])
      .navigationBarTitle("Instafilter")
      .alert(isPresented: $showingSaveError) {
        Alert(
          title: Text("Save error"),
          message: Text("There is nothing to save yet. Select a picture first."),
          dismissButton: .default(Text("OK"))
        )
      }
      .sheet(isPresented: $showingImagePicker) {
        ImagePicker(image: self.$inputImage, onDismiss: self.loadImage)
      }
      .actionSheet(isPresented: $showingFilterSheet) {
        ActionSheet(title: Text("Select a filter"), buttons: [
          .default(Text("Crystallize")) { self.setFilter(CIFilter.crystallize(), "Crystallize") },
          .default(Text("Edges")) { self.setFilter(CIFilter.edges(), "Edges") },
          .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur(), "Gaussian Blur") },
          .default(Text("Pixellate")) { self.setFilter(CIFilter.pixellate(), "Pixellate") },
          .default(Text("Sepia Tone")) { self.setFilter(CIFilter.sepiaTone(), "Sepia Tone") },
          .default(Text("Unsharp Mask")) { self.setFilter(CIFilter.unsharpMask(), "Unsharp Mask") },
          .default(Text("Vignette")) { self.setFilter(CIFilter.vignette(), "Vignette") },
          .cancel()
        ])
      }
    }
  }

  func loadImage() {
    guard let inputImage = inputImage else { return }

    let beginImage = CIImage(image: inputImage)
    currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
    applyProcessing()
  }

  func applyProcessing() {
    let inputKeys = currentFilter.inputKeys
    if inputKeys.contains(kCIInputIntensityKey) {
      currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
    }
    if inputKeys.contains(kCIInputRadiusKey) {
      currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
    }
    if inputKeys.contains(kCIInputScaleKey) {
      currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
    }

    guard let outputImage = currentFilter.outputImage else { return }

    if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
      let uiImage = UIImage(cgImage: cgimg)
      image = Image(uiImage: uiImage)
      processedImage = uiImage
    }
  }

  func setFilter(_ filter: CIFilter, _ filterName: String) {
    currentFilterName = filterName
    currentFilter = filter
    loadImage()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
