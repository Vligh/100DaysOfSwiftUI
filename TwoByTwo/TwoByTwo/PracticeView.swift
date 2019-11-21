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
  var action: () -> Void

  var body: some View {
    Button("\(value)") {
      self.action()
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

struct Question {
  var multiplier: Int
  var multiplicant: Int

  var product: Int {
    multiplier * multiplicant
  }

  var toString: String {
    "\(multiplier) X \(multiplicant) = ?"
  }
}

struct PracticeView: View {
  let questionsPerTable = 11

  @EnvironmentObject var settings: PracticeSettings

  @State private var questionsAnswered = 0
  @State private var currentQuestion = Question(multiplier: 2, multiplicant: 2)
  @State private var questions: [Question] = []
  @State private var nextButtonDisabled = true

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
          Text(self.currentQuestion.toString)
            .font(.largeTitle)
            .padding(.bottom, 50)
            .padding(.top, -10)

          HStack {
            Spacer()
            AnswerButton(value: 2, isCorrectAnswer: false, action: {
              self.nextButtonDisabled = false
            })
            Spacer()
            AnswerButton(value: 3, isCorrectAnswer: false, action: {
              self.nextButtonDisabled = false
            })
            Spacer()
          }
          .padding(.bottom, 50)

          HStack {
            Spacer()
            AnswerButton(value: 4, isCorrectAnswer: false, action: {
              self.nextButtonDisabled = false
            })
            Spacer()
            AnswerButton(value: 5, isCorrectAnswer: false, action: {
              self.nextButtonDisabled = false
            })
            Spacer()
          }
        }
      }

      Spacer()

      Button("Next") {
        self.questionsAnswered += 1
        self.currentQuestion = self.pickNewQuestion()
        self.nextButtonDisabled = true
      }
      .frame(width: 330)
      .padding(20)
      .background(self.nextButtonDisabled ? Color.gray : Color.blue)
      .foregroundColor(.white)
      .clipShape(RoundedRectangle(cornerRadius: 15))
      .disabled(self.nextButtonDisabled)
    }
    .onAppear(perform: {
      self.generateQuestions()
      self.currentQuestion = self.pickNewQuestion()
    })
  }

  func pickNewQuestion() -> Question {
    self.questions.shuffle()

    return self.questions.popLast() ?? Question(multiplier: 2, multiplicant: 2)
  }

  func generateQuestions() {
    for multiplier in 1...self.settings.practiceRange {
      for multiplicant in 0..<self.questionsPerTable {
        self.questions.append(Question(multiplier: multiplier, multiplicant: multiplicant))
      }
    }

    self.questions.shuffle()
  }
}

struct PracticeView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeView().environmentObject(PracticeSettings())
  }
}
