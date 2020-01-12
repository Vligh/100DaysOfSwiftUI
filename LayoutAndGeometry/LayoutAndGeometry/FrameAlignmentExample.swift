//
//  FrameAlignmentExample.swift
//  LayoutAndGeometry
//
//  Created by Vitali Tatarintev on 12.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct FrameAlignmentExample: View {
  var body: some View {
    Text("Live long and prosper")
      .frame(width: 300, height: 300, alignment: .topLeading)
  }
}

struct FrameAlignmentExample_Previews: PreviewProvider {
  static var previews: some View {
    FrameAlignmentExample()
  }
}
