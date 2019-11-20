//
//  PracticeView.swift
//  TwoByTwo
//
//  Created by Vitali Tatarintev on 19.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct AnswerButton: View {
  var value: Int
  var isCorrectAnswer: Bool

  var body: some View {
    Button("\(value)") {

    }
    .font(.title)
    .frame(width: 40)
    .padding(35)
    .background(Color.orange)
    .foregroundColor(.white)
    .clipShape(RoundedRectangle(cornerRadius: 5))
    .animation(.easeInOut)
  }
}

struct PracticeView: View {
  let questionsPerTable = 11

  @EnvironmentObject var settings: PracticeSettings

  @State private var questionsAnswered = 0

  var totalQuestions: Int {
    let numberOfQuestions = Int(self.settings.selectedNumberOfQuestions) ?? 0

    return numberOfQuestions == 0
      ? questionsPerTable * self.settings.practiceRange
      : numberOfQuestions
  }

  var body: some View {
    VStack {
      HStack {
        Text("\(self.questionsAnswered)/\(self.totalQuestions)")
          .font(.headline)

        Spacer()

        Button("X") {
          self.settings.isPracticeStarted = false
        }
        .frame(width: 25, height: 25)
        .padding(5)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
      }
      .padding(20)

      Spacer()

      Group {
        VStack {
          Text("2 x 2 = ?")
            .font(.largeTitle)
            .padding(.bottom, 50)
            .padding(.top, -150)

          HStack {
            Spacer()
            AnswerButton(value: 2, isCorrectAnswer: false)
            Spacer()
            AnswerButton(value: 3, isCorrectAnswer: false)
            Spacer()
          }
          .padding(.bottom, 50)

          HStack {
            Spacer()
            AnswerButton(value: 4, isCorrectAnswer: true)
            Spacer()
            AnswerButton(value: 5, isCorrectAnswer: false)
            Spacer()
          }
        }
      }

      Spacer()

    }
  }
}

struct PracticeView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeView().environmentObject(PracticeSettings())
  }
}
