//
//  ContentView.swift
//  Moonshot
//
//  Created by Vitali Tatarintev on 25.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  let astronauts = Bundle.main.decode("astronauts.json")

  var body: some View {
    Text("Number of astronauts \(astronauts.count)")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
