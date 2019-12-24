//
//  FilterExamplesVIew.swift
//  Instafilter
//
//  Created by Vitali Tatarintev on 24.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct FilterExamplesView: View {
  @State private var image: Image?

  var body: some View {
    VStack {
      image?
        .resizable()
        .scaledToFit()
    }
    .onAppear(perform: loadImage)
  }

  func loadImage() {
    guard let inputImage = UIImage(named: "Example") else { return }
    let beginImage = CIImage(image: inputImage)

    //    let context = CIContext() // sepia, pixellate, crystallize
    let context = CIContext() // distortion
    guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
    //    let currentFilter = CIFilter.sepiaTone()
    //    let currentFilter = CIFilter.pixellate()
    //    let currentFilter = CIFilter.crystallize()

    //    currentFilter.inputImage = beginImage // sepia, pixellate
    currentFilter.setValue(beginImage, forKey: kCIInputImageKey) // crystallize, distortion
    //    currentFilter.intensity = 1 // sepia
    //    currentFilter.scale = 20 // pixellate
    //    currentFilter.radius = 20 // crystallize
    currentFilter.setValue(500, forKey: kCIInputRadiusKey) // distortion
    currentFilter.setValue(CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2), forKey: kCIInputCenterKey)

    guard let outputImage = currentFilter.outputImage else { return }

    if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
      let uiImage = UIImage(cgImage: cgimg)
      image = Image(uiImage: uiImage)
    }
  }
}

struct FilterExamplesVIew_Previews: PreviewProvider {
  static var previews: some View {
    FilterExamplesView()
  }
}
