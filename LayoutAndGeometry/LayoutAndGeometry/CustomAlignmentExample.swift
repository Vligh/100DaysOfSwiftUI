//
//  CustomAlignmentExample.swift
//  LayoutAndGeometry
//
//  Created by Vitali Tatarintev on 12.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct CustomAlignmentExample: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Hello, world!")
        .alignmentGuide(.leading) { d in d[.trailing] }
      Text("This is a longer line of text")
    }
    .background(Color.red)
    .frame(width: 400, height: 400)
    .background(Color.blue)
  }
}

struct CustomAlignmentExample_Previews: PreviewProvider {
  static var previews: some View {
    CustomAlignmentExample()
  }
}
