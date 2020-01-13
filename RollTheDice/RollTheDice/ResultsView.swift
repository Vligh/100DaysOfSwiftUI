//
//  ResultsView.swift
//  RollTheDice
//
//  Created by Vitali Tatarintev on 13.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ResultsView: View {
  @EnvironmentObject var rolls: Rolls

  let imageSize: CGFloat = 64

  var sortedRolls: [Roll] {
    self.rolls.all.sorted(by: { $0.createdAt > $1.createdAt })
  }

  var body: some View {
    NavigationView {
      List {
        ForEach(self.sortedRolls) { roll in
          HStack {
            Image("inverted-dice-\(roll.firstDice)")
              .resizable()
              .scaledToFit()
              .frame(width: self.imageSize, height: self.imageSize)

            Image("inverted-dice-\(roll.secondDice)")
              .resizable()
              .scaledToFit()
              .frame(width: self.imageSize, height: self.imageSize)
          }
        }
      }
      .navigationBarTitle("Results")
    }
  }
}

struct ResultsView_Previews: PreviewProvider {
  static var previews: some View {
    ResultsView()
  }
}
