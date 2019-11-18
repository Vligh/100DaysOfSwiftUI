//
//  ContentView.swift
//  TwoByTwo
//
//  Created by Vitali Tatarintev on 18.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  let numberOfQuestions = ["5", "10", "20", "All"]

  @State private var practiceRange = 4
  @State private var selectedNumberOfQuestions = "10"

  var body: some View {
    VStack {
      Text("Two by Two")
        .font(.largeTitle)

      Group {
        Stepper("Practice up to ...", value: $practiceRange, in: 2...10)
          .padding(20)

        HStack(alignment: .center) {
          ForEach(2 ..< 11) { numbersRange in
            Text("\(numbersRange)")
              .frame(width: 20)
              .padding(7)
              .background(numbersRange <= self.practiceRange ? Color.orange : Color.gray)
              .foregroundColor(.white)
              .clipShape(RoundedRectangle(cornerRadius: 5))
              .animation(.easeInOut)
          }
        }
      }

      Group {
        Text("Number of questions?")
          .font(.headline)
          .padding(10)
          .padding(.top, 30)

        HStack(alignment: .center) {
          ForEach(numberOfQuestions, id: \.self) { questionNumber in
            Button(questionNumber) {
              self.selectedNumberOfQuestions = questionNumber
            }
            .frame(width: 50)
            .padding(18)
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay(
              withAnimation(.spring()) {
                questionNumber == self.selectedNumberOfQuestions ? RoundedRectangle(cornerRadius: 15).stroke(Color.orange, lineWidth: 3) : nil
              }
            )
          }
        }
      }

      Spacer()

      Button("Start") {

      }
      .frame(width: 330)
      .padding(20)
      .background(Color.blue)
      .foregroundColor(.white)
      .clipShape(RoundedRectangle(cornerRadius: 15))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
