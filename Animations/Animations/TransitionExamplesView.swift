//
//  TransitionExamplesView.swift
//  Animations
//
//  Created by Vitali Tatarintev on 17.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct TransitionExamplesView: View {
  @State private var isShowingRed = false

  var body: some View {
    VStack {
      Button("Tap Me") {
        withAnimation {
          self.isShowingRed.toggle()
        }
      }

      if isShowingRed {
        Rectangle()
          .fill(Color.red)
          .frame(width: 200, height: 200)
          // .transition(.scale)
          .transition(.asymmetric(insertion: .scale, removal: .opacity))
      }
    }
  }
}

struct TransitionExamplesView_Previews: PreviewProvider {
  static var previews: some View {
    TransitionExamplesView()
  }
}
