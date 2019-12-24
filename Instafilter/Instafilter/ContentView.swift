//
//  ContentView.swift
//  Instafilter
//
//  Created by Vitali Tatarintev on 24.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var image: Image?
  @State private var showingImagePicker = false

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
      ImagePicker()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
