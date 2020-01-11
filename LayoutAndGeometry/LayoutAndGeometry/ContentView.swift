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

    // More on custom alignment
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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
