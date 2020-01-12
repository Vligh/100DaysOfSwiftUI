//
//  CustomAlignmentGuideExample.swift
//  LayoutAndGeometry
//
//  Created by Vitali Tatarintev on 12.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct CustomAlignmentGuideExample: View {
  var body: some View {
    HStack {
      VStack {
        Text("@twostraws")
          .alignmentGuide(.midAccoutnAndName) { d in d[VerticalAlignment.center]}
        Image("young")
        .resizable()
          .frame(width: 64, height: 64)
      }

      VStack {
        Text("Full name:")
        Text("PAUL HUDSON")
          .alignmentGuide(.midAccoutnAndName) { d in d[VerticalAlignment.center] }
          .font(.largeTitle)
      }
    }
  }
}

extension VerticalAlignment {
  enum MidAccountAndName: AlignmentID {
    static func defaultValue(in d: ViewDimensions) -> CGFloat {
      d[.top]
    }
  }

  static let midAccoutnAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignmentGuideExample_Previews: PreviewProvider {
  static var previews: some View {
    CustomAlignmentGuideExample()
  }
}
