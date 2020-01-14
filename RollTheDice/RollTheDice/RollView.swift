//
//  RollView.swift
//  RollTheDice
//
//  Created by Vitali Tatarintev on 13.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct RollView: View {
  @EnvironmentObject var rolls: Rolls

  let diceSize: CGFloat = 150
  let timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()

  @State private var currentRoll = Roll(firstDice: 1, secondDice: 6)
  @State private var rollIsInProgress = false
  @State private var animationRollTimes = 10

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
        self.rollIsInProgress = true
      }
      .font(.title)
      .frame(width: 250)
      .padding(20)
      .background(rollIsInProgress ? Color.gray : Color.blue)
      .foregroundColor(.white)
      .clipShape(RoundedRectangle(cornerRadius: 15))
      .padding(.bottom, 30)
      .disabled(rollIsInProgress)
    }
    .onReceive(timer) { time in
      guard self.rollIsInProgress else { return }

      if self.animationRollTimes > 0 {
        let firstDice = Int.random(in: 1...6)
        let secondDice = Int.random(in: 1...6)

        withAnimation(.spring()) {
          self.currentRoll = Roll(firstDice: firstDice, secondDice: secondDice)
        }
        self.animationRollTimes -= 1
      } else {
        self.rollIsInProgress = false
        self.animationRollTimes = 10
        self.rolls.add(self.currentRoll)
      }
    }
  }
}

struct RollView_Previews: PreviewProvider {
  static var previews: some View {
    RollView()
  }
}
