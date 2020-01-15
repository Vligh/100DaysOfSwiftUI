//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Vitali Tatarintev on 15.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
  var body: some View {
    VStack {
      Text("Welcome to SnowSeeker!")
        .font(.largeTitle)

      Text("Please select a resort from the left-hand menu; swipe from the left edge to show it.")
        .foregroundColor(.secondary)
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView()
  }
}
