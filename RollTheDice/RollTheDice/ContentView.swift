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
          Text("Roll")
      }

      ResultsView()
        .tabItem {
          Image("rule-book")
          Text("Recent rolls")
        }
    }
    .environmentObject(rolls)
    .accentColor(.blue)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
