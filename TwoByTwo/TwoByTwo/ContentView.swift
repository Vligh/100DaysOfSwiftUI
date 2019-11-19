//
//  ContentView.swift
//  TwoByTwo
//
//  Created by Vitali Tatarintev on 18.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var settings: PracticeSettings

  var body: some View {
    VStack {
      if self.settings.isPracticeStarted {
        PracticeView().environmentObject(self.settings)
      } else {
        StartView().environmentObject(self.settings)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
