//
//  TransitionExamplesView.swift
//  Animations
//
//  Created by Vitali Tatarintev on 17.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
  let amount: Double
  let anchor: UnitPoint

  func body(content: Content) -> some View {
    content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
  }
}

extension AnyTransition {
  static var pivot: AnyTransition {
    .modifier(
      active: CornerRotateModifier(amount: -90, anchor: .topLeading),
      identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
    )
  }
}

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
          // .transition(.asymmetric(insertion: .scale, removal: .opacity))
          .transition(.pivot)
      }
    }
  }
}

struct TransitionExamplesView_Previews: PreviewProvider {
  static var previews: some View {
    TransitionExamplesView()
  }
}
