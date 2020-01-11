//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Vitali Tatarintev on 11.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {

//    // Frame alignment
//    Text("Live long and prosper")
//      .frame(width: 300, height: 300, alignment: .topLeading)

//    // Stack alignment
//    HStack(alignment: .lastTextBaseline) {
//      Text("Live").font(.caption)
//      Text("long")
//      Text("and").font(.title)
//      Text("prosper").font(.largeTitle)
//    }


//    // Custom alignment
//    VStack(alignment: .leading) {
//      Text("Hello, world!")
//        .alignmentGuide(.leading) { d in d[.trailing] }
//      Text("This is a longer line of text")
//    }
//    .background(Color.red)
//    .frame(width: 400, height: 400)
//    .background(Color.blue)

//    // More on custom alignment
//    VStack(alignment: .leading) {
//      ForEach(0..<10) { position in
//        Text("Number \(position)")
//          .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
//      }
//    }
//    .background(Color.red)
//    .frame(width: 400, height: 400)
//    .background(Color.blue)

    // Custom alignment guide
//    HStack {
//      VStack {
//        Text("@twostraws")
//          .alignmentGuide(.midAccoutnAndName) { d in d[VerticalAlignment.center]}
//        Image("young")
//        .resizable()
//          .frame(width: 64, height: 64)
//      }
//
//      VStack {
//        Text("Full name:")
//        Text("PAUL HUDSON")
//          .alignmentGuide(.midAccoutnAndName) { d in d[VerticalAlignment.center] }
//          .font(.largeTitle)
//      }
//    }

    Text("Hello, world!")
      .offset(x: 100, y: 100)
      .background(Color.red)
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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
