//
//  HidingAndGroupingExampleView.swift
//  Accessibility
//
//  Created by Vitali Tatarintev on 30.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct HidingAndGroupingExampleView: View {
  var body: some View {
    VStack {
      Image(decorative: "ales-krivec-15949")
        .accessibility(hidden: true)

      VStack {
        // Those two views a two sperate views for accessability
        // using `accessibilityElement(children: .combine)` merges them into a group
        Text("Your score is")
        Text("1000")
          .font(.title)
      }
      .accessibilityElement(children: .combine)
      .accessibility(label: Text("Your score is 1000"))
    }
  }
}

struct HidingAndGroupingExampleView_Previews: PreviewProvider {
  static var previews: some View {
    HidingAndGroupingExampleView()
  }
}
