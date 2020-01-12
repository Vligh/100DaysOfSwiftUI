//
//  AbsolutePositioningExample.swift
//  LayoutAndGeometry
//
//  Created by Vitali Tatarintev on 12.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct AbsolutePositioningExample: View {
  var body: some View {
    Text("Hello, world!")
      .offset(x: 100, y: 100)
      .background(Color.red)
  }
}

struct AbsolutePositioningExample_Previews: PreviewProvider {
  static var previews: some View {
    AbsolutePositioningExample()
  }
}
