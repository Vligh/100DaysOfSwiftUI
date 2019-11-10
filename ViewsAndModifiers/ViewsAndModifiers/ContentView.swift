//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Vitali Tatarintev on 10.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

extension View {
  func titleStyle() -> some View {
    self.modifier(Title())
  }
}

struct Title: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.title)
      .foregroundColor(.blue)
  }
}

struct ContentView: View {
  var body: some View {
    Text("Hello World")
      .titleStyle()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
