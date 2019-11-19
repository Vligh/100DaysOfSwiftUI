//
//  PracticeView.swift
//  TwoByTwo
//
//  Created by Vitali Tatarintev on 19.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct PracticeView: View {
  var body: some View {
    VStack {
      HStack {
        Spacer()

        Button("X") {

        }
        .frame(width: 25, height: 25)
        .padding(5)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
      }
      .padding(20)

      Text("Practice screen")

      Spacer()

    }
  }
}

struct PracticeView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeView()
  }
}
