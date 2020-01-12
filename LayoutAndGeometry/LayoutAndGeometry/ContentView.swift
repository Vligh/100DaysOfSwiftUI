//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Vitali Tatarintev on 11.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct OuterView: View {
  var body: some View {
    VStack {
      Text("Top")

      InnerView()
        .background(Color.green)

      Text("Bottom")
    }
  }
}

struct InnerView: View {
  var body: some View {
    HStack {
      Text("Left")

      GeometryReader { geo in
        Text("Center")
          .background(Color.blue)
          .onTapGesture {
            print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
            print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
            print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
          }
      }
      .background(Color.orange)

      Text("Right")
    }
  }
}

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

//    // Absolute positioning
//    Text("Hello, world!")
//      .offset(x: 100, y: 100)
//      .background(Color.red)

//    // Frames of GeometryReader
//    VStack {
//      GeometryReader { geo in
//        Text("Hello, world!")
//          .frame(width: geo.size.width * 0.9)
//          .background(Color.red)
//      }
//      .background(Color.green)
//
//      Text("More text")
//        .background(Color.blue)
//    }

//    // Coordinates of GeometryReader
//    OuterView()
//      .background(Color.red)
//      .coordinateSpace(name: "Custom")

    // Button below the list
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
