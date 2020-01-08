//
//  ContentView.swift
//  Flashzilla
//
//  Created by Vitali Tatarintev on 08.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var cards = [Card](repeating: Card.example, count: 10)

  var body: some View {
    ZStack {
      Image("background")
        .resizable()
        .scaledToFill()
        .edgesIgnoringSafeArea(.all)

      VStack {
        ZStack {
          ForEach(0..<cards.count, id: \.self) { index in
            CardView(card: self.cards[index])
              .stacked(at: index, in: self.cards.count)
          }
        }
      }
    }
  }
}

extension View {
  func stacked(at position: Int, in total: Int) -> some View {
    let offset = CGFloat(total - position)
    return self.offset(CGSize(width: 0, height: offset * 10))
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}