//
//  StackAlignmentExample.swift
//  LayoutAndGeometry
//
//  Created by Vitali Tatarintev on 12.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct StackAlignmentExample: View {
  var body: some View {
    HStack(alignment: .lastTextBaseline) {
      Text("Live").font(.caption)
      Text("long")
      Text("and").font(.title)
      Text("prosper").font(.largeTitle)
    }
  }
}

struct StackAlignmentExample_Previews: PreviewProvider {
  static var previews: some View {
    StackAlignmentExample()
  }
}
