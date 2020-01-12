//
//  GeometryReaderFramesExample.swift
//  LayoutAndGeometry
//
//  Created by Vitali Tatarintev on 12.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct GeometryReaderFramesExample: View {
  var body: some View {
    VStack {
      GeometryReader { geo in
        Text("Hello, world!")
          .frame(width: geo.size.width * 0.9)
          .background(Color.red)
      }
      .background(Color.green)

      Text("More text")
        .background(Color.blue)
    }
  }
}

struct GeometryReaderFramesExample_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReaderFramesExample()
  }
}
