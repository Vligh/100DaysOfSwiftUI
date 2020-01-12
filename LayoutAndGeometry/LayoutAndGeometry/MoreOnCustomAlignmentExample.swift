//
//  MoreOnCustomAlignmentExample.swift
//  LayoutAndGeometry
//
//  Created by Vitali Tatarintev on 12.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct MoreOnCustomAlignmentExample: View {
  var body: some View {
    VStack(alignment: .leading) {
      ForEach(0..<10) { position in
        Text("Number \(position)")
          .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
      }
    }
    .background(Color.red)
    .frame(width: 400, height: 400)
    .background(Color.blue)
  }
}

struct MoreOnCustomAlignmentExample_Previews: PreviewProvider {
  static var previews: some View {
    MoreOnCustomAlignmentExample()
  }
}
