//
//  Examples.swift
//  Animations
//
//  Created by Vitali Tatarintev on 17.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ExamplesView: View {
  @State private var animationAmount: CGFloat = 1

  var body: some View {
    print(animationAmount)

    return VStack {
      Stepper("Scale amount", value: $animationAmount.animation(
        Animation.easeInOut(duration: 1).repeatCount(3, autoreverses: true)
      ), in: 1...10)

      Spacer()

      Button("Tap Me") {
        self.animationAmount += 1
      }
      .padding(40)
      .background(Color.red)
      .foregroundColor(.white)
      .clipShape(Circle())
      .scaleEffect(animationAmount)
    }
  }
}

struct Examples_Previews: PreviewProvider {
  static var previews: some View {
    ExamplesView()
  }
}
