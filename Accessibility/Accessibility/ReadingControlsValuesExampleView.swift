//
//  ReadingControlsValuesExampleView.swift
//  Accessibility
//
//  Created by Vitali Tatarintev on 30.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ReadingControlsValuesExampleView: View {
  @State private var estimate = 25.0
  @State private var rating = 3

  var body: some View {
    VStack {
      Slider(value: $estimate, in: 0...50)
        .padding()
        .accessibility(value: Text("\(Int(estimate))")) // By default it's read as a percentage

      Stepper("Rate our service: \(rating)/5", value: $rating, in: 1...5)
        .accessibility(value: Text("\(rating) out of 5"))
    }
  }
}

struct ReadingControlsValuesExampleView_Previews: PreviewProvider {
  static var previews: some View {
    ReadingControlsValuesExampleView()
  }
}
