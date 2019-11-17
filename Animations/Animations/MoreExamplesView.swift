//
//  MoreExamplesView.swift
//  Animations
//
//  Created by Vitali Tatarintev on 17.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct MoreExamplesView: View {
  @State private var animationAmount = 0.0

  var body: some View {
    Button("Tap Me") {
      withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
        self.animationAmount += 360
      }
    }
    .padding(50)
    .background(Color.red)
    .foregroundColor(.white)
    .clipShape(Circle())
    .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
  }
}

struct MoreExamplesView_Previews: PreviewProvider {
  static var previews: some View {
    MoreExamplesView()
  }
}
