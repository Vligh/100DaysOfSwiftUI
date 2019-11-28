//
//  AnimatedShapeView.swift
//  Drawing
//
//  Created by Vitali Tatarintev on 28.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//
// From tutorial:
// https://www.hackingwithswift.com/books/ios-swiftui/animating-simple-shapes-with-animatabledata

import SwiftUI

struct Trapezoid: Shape {
  var insetAmount: CGFloat
  var animatableData: CGFloat {
    get { insetAmount }
    set { self.insetAmount = newValue }
  }

  func path(in rect: CGRect) -> Path {
    var path = Path()

    path.move(to: CGPoint(x: 0, y: rect.maxY))
    path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxY, y: rect.maxY))
    path.addLine(to: CGPoint(x: 0, y: rect.maxY))

    return path
  }
}

struct AnimatedShapeView: View {
  @State private var insetAmount: CGFloat = 50

  var body: some View {
    Trapezoid(insetAmount: insetAmount)
      .frame(width: 200, height: 200)
      .onTapGesture {
        withAnimation {
          self.insetAmount = CGFloat.random(in: 10...90)
        }
      }
  }
}

struct AnimatedShapeView_Previews: PreviewProvider {
  static var previews: some View {
    AnimatedShapeView()
  }
}
