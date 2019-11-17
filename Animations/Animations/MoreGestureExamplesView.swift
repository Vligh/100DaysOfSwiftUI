//
//  MoreGestureExamplesView.swift
//  Animations
//
//  Created by Vitali Tatarintev on 17.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct MoreGestureExamplesView: View {
  let letters = Array("Hello SwiftUI")
  @State private var enabled = false
  @State private var dragAmount = CGSize.zero

  var body: some View {
    HStack(spacing: 0) {
      ForEach(0..<letters.count) { num in
        Text(String(self.letters[num]))
          .padding(5)
          .font(.title)
          .background(self.enabled ? Color.blue : Color.red)
          .offset(self.dragAmount)
          .animation(Animation.default.delay(Double(num) / 20))
      }
    }
    .gesture(
      DragGesture()
        .onChanged { self.dragAmount = $0.translation }
        .onEnded { _ in
          self.dragAmount = .zero
          self.enabled.toggle()
      }
    )
  }
}

struct MoreGestureExamplesView_Previews: PreviewProvider {
  static var previews: some View {
    MoreGestureExamplesView()
  }
}
