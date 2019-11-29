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

  let numberOfQuestions = ["5", "10", "20", "All"]

  @State private var practiceRange = 4
  @State private var selectedNumberOfQuestions = "10"
  @State private var isPracticeStarted = false

  var body: some View {
    VStack {
      Text("Two by Two")
        .font(.largeTitle)

      Group {
        Stepper("Practice up to ...", value: $practiceRange, in: 2...10)
          .padding(20)

        HStack(alignment: .center) {
          ForEach(2 ..< 11) { numbersRange in
            Button("\(numbersRange)") {
              self.practiceRange = numbersRange
            }
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
        self.isPracticeStarted = true
        self.settings.practiceRange = self.practiceRange
        self.settings.selectedNumberOfQuestions = self.selectedNumberOfQuestions
      }
      .frame(width: 330)
      .padding(20)
      .background(Color.blue)
      .foregroundColor(.white)
      .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    .onAppear(perform: {
      self.practiceRange = self.settings.practiceRange
      self.selectedNumberOfQuestions = self.settings.selectedNumberOfQuestions
    })
    .sheet(isPresented: $isPracticeStarted) {
      PracticeView().environmentObject(self.settings)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
