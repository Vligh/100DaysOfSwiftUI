//
//  ViewsWithLabelsExampleView.swift
//  Accessibility
//
//  Created by Vitali Tatarintev on 30.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ViewsWithLabelsExampleView: View {
  let pictures = [
    "ales-krivec-15949",
    "galina-n-189483",
    "kevin-horstmann-141705",
    "nicolas-tissot-335096"
  ]

  let labels = [
    "Tulips",
    "Frozen tree buds",
    "Sunflowers",
    "Fireworks"
  ]

  @State private var selectedPicture = Int.random(in: 0...3)

  var body: some View {
    Image(pictures[selectedPicture])
      .resizable()
      .scaledToFit()
      .accessibility(label: Text(labels[selectedPicture]))
      .accessibility(addTraits: .isButton)
      .accessibility(removeTraits: .isImage)
      .onTapGesture {
        self.selectedPicture = Int.random(in: 0...3)
    }
  }
}

struct ViewsWithLabelsExampleView_Previews: PreviewProvider {
  static var previews: some View {
    ViewsWithLabelsExampleView()
  }
}
