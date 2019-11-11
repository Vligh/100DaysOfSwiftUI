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
  
  var body: some View {
    VStack {
      Text("Make your move")
        .padding()
      
      ForEach(0 ..< moves.count) { move in
        Button(action: {
          // Do something
        }) {
          Text(self.moves[move])
            .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
            .border(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            .padding()
        }
      }
      
      Text(gameResultText)
        .padding()
      Text(gameResultDescription)
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
