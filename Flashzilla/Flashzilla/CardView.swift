//
//  CardView.swift
//  Flashzilla
//
//  Created by Vitali Tatarintev on 08.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct CardView: View {
  let card: Card

  @State private var isShowingAnwer = false

  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 25, style: .continuous)
        .fill(Color.white)
        .shadow(radius: 10)

      VStack {
        Text(card.prompt)
          .font(.largeTitle)

        if isShowingAnwer {
          Text(card.answer)
            .font(.title)
            .foregroundColor(.secondary)
        }
      }
      .padding(20)
      .multilineTextAlignment(.center)
    }
    .frame(width: 450, height: 250)
    .onTapGesture {
      self.isShowingAnwer.toggle()
    }
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(card: Card.example)
  }
}
