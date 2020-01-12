//
//  HeaderListButtonExample.swift
//  LayoutAndGeometry
//
//  Created by Vitali Tatarintev on 12.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct HeaderListButtonExample: View {
  var body: some View {
    VStack {
      Text("Header")
      .padding()

      GeometryReader { geo in
        List {
          ForEach(0..<15) { index in
            Text("Item #\(index)")
          }
        }
      }

      Button(action: {

      }) {
        Text("Button text")
      }
      .frame(width: 200)
      .padding(20)
      .background(Color.blue)
      .foregroundColor(.white)
      .clipShape(RoundedRectangle(cornerRadius: 10))
    }
  }
}

struct HeaderListButtonExample_Previews: PreviewProvider {
  static var previews: some View {
    HeaderListButtonExample()
  }
}
