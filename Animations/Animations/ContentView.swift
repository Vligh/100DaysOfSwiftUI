//
//  ContentView.swift
//  Animations
//
//  Created by Vitali Tatarintev on 16.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var animationAmount: CGFloat = 1

  var body: some View {
    Button("Tap Me") {
      // self.animationAmount += 1
    }
    .padding(50)
    .background(Color.red)
    .foregroundColor(.white)
    .clipShape(Circle())
    .overlay(
      Circle()
        .stroke(Color.red)
        .scaleEffect(animationAmount)
        .opacity(Double(2 - animationAmount))
        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false))
    )
    //.scaleEffect(animationAmount)
    //.blur(radius: (animationAmount - 1) * 3)
    //.animation(.default)
    //.animation(.easeOut)
    //.animation(.interpolatingSpring(stiffness: 50, damping: 1))
    //.animation(.easeInOut(duration: 2))
    //.animation(Animation.easeInOut(duration: 2).delay(1))
    //.animation(Animation.easeInOut(duration: 1).repeatCount(3, autoreverses: true))
    //.animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
    .onAppear {
      self.animationAmount = 2
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
