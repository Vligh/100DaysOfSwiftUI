//
//  RollView.swift
//  RollTheDice
//
//  Created by Vitali Tatarintev on 13.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct RollView: View {
  let diceSize: CGFloat = 150

  @State private var currentRoll = Roll(firstDice: 1, secondDice: 6)

  var body: some View {
    VStack {
      GeometryReader { _ in
        HStack {
          Image("inverted-dice-\(self.currentRoll.firstDice)")
            .resizable()
            .scaledToFit()
            .frame(width: self.diceSize, height: self.diceSize)

          Image("inverted-dice-\(self.currentRoll.secondDice)")
            .resizable()
            .scaledToFit()
            .frame(width: self.diceSize, height: self.diceSize)
        }
      }

      Button("Roll") {
        self.rollTheDice()
      }
      .font(.title)
      .frame(width: 250)
      .padding(20)
      .background(Color.blue)
      .foregroundColor(.white)
      .clipShape(RoundedRectangle(cornerRadius: 15))
      .padding(.bottom, 30)
    }
  }

  func rollTheDice() {
    let firstDice = Int.random(in: 1...6)
    let secondDice = Int.random(in: 1...6)

    self.currentRoll = Roll(firstDice: firstDice, secondDice: secondDice)
  }
}

struct RollView_Previews: PreviewProvider {
  static var previews: some View {
    RollView()
  }
}
