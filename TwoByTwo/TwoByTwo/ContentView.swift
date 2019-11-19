//
//  ContentView.swift
//  TwoByTwo
//
//  Created by Vitali Tatarintev on 18.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var isPracticeStarted = false

  var body: some View {
    VStack {
      if isPracticeStarted {
        PracticeView()
      } else {
        StartView()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
