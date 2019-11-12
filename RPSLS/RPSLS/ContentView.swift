//
//  ContentView.swift
//  RPSLS
//
//  Created by Vitali Tatarintev on 11.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  let moves = ["Rock", "Paper", "Scissors", "Lizard", "Spock"]
  @State private var gameResultText = ""
  @State private var gameResultDescription = ""
  
  let whatDoesItDo = [
    "Rock": ["Scissors": "crushes", "Lizard": "crushes"],
    "Paper": ["Rock": "covers", "Spock": "disproves"],
    "Scissors": ["Paper": "cuts", "Lizard": "decapitates"],
    "Lizard": ["Paper": "eats", "Spock": "poisons"],
    "Spock": ["Rock": "vaporizes", "Scissors": "smashes"]
  ]
  let doesWin = [
    "Rock": ["Paper": false, "Scissors": true, "Lizard": true, "Spock": false],
    "Paper": ["Rock": true, "Scissors": false, "Lizard": false, "Spock": true],
    "Scissors": ["Rock": false, "Paper": true, "Lizard": true, "Spock": false],
    "Lizard": ["Rock": false, "Paper": true, "Scissors": false, "Spock": true],
    "Spock": ["Rock": true, "Paper": false, "Scissors": true, "Lizard": false]
  ]

  var body: some View {
    VStack {
      Text("Make your move")
        .padding()

      ForEach(0 ..< moves.count) { move in
        Button(action: {
          let aiMoveIndex = Int.random(in: 0 ..< self.moves.count)
          let aiMove = self.moves[aiMoveIndex]
          let userMove = self.moves[move]
          var winner = userMove
          var loser = aiMove
          var action = ""

          if userMove == aiMove {
            self.gameResultText = "Draw!"
            action = "does nothing to"
          } else if self.doesWin[userMove]![aiMove]! {
            self.gameResultText = "You won!"
            action = self.whatDoesItDo[userMove]![aiMove]!
          } else {
            self.gameResultText = "You lost!"
            winner = aiMove
            loser = userMove
            action = self.whatDoesItDo[aiMove]![userMove]!
          }

          self.gameResultDescription = "\(winner) \(action) \(loser)"
        }) {
          Text(self.moves[move])
            .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
            .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .padding()
        }
      }
      
      Text(gameResultText)
        .frame(width: 200)
        .padding()
      Text(gameResultDescription)
        .frame(width: 300)
        .padding()
      
      Spacer()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
