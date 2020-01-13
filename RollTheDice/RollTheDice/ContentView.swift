//
//  ContentView.swift
//  RollTheDice
//
//  Created by Vitali Tatarintev on 13.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var rolls = Rolls()

  var body: some View {
    TabView {
      RollView()
        .tabItem {
          Image("rolling-dices")
      }

      ResultsView()
        .tabItem {
          Image("rule-book")
        }
    }
    .environmentObject(rolls)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
