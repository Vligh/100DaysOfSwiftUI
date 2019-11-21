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

  @State private var color = Color.orange

  var body: some View {
    Button("\(value)") {
      self.action()

      self.color = self.isCorrectAnswer ? Color.green : Color.red
    }
    .font(.title)
    .frame(width: 40)
    .padding(35)
    .background(self.color)
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
  @State private var currentAnswerSuggestions = [
    (value: 0, isCorrect: false),
    (value: 0, isCorrect: false),
    (value: 0, isCorrect: false),
    (value: 0, isCorrect: false)
  ]
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
            AnswerButton(value: self.currentAnswerSuggestions[0].value, isCorrectAnswer: self.currentAnswerSuggestions[0].isCorrect, action: {
              self.nextButtonDisabled = false
            })
            Spacer()
            AnswerButton(value: self.currentAnswerSuggestions[1].value, isCorrectAnswer: self.currentAnswerSuggestions[1].isCorrect, action: {
              self.nextButtonDisabled = false
            })
            Spacer()
          }
          .padding(.bottom, 50)

          HStack {
            Spacer()
            AnswerButton(value: self.currentAnswerSuggestions[2].value, isCorrectAnswer: self.currentAnswerSuggestions[2].isCorrect, action: {
              self.nextButtonDisabled = false
            })
            Spacer()
            AnswerButton(value: self.currentAnswerSuggestions[3].value, isCorrectAnswer: self.currentAnswerSuggestions[3].isCorrect, action: {
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
        self.currentAnswerSuggestions = self.generateAnswerSuggestions(question: self.currentQuestion)
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
      self.currentAnswerSuggestions = self.generateAnswerSuggestions(question: self.currentQuestion)
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

  func generateAnswerSuggestions(question: Question) -> [(value: Int, isCorrect: Bool)] {
    var answers = [
      (value: question.product, isCorrect: true),
      (value: Question(multiplier: question.multiplier - 1, multiplicant: question.multiplicant).product, isCorrect: false),
      (value: Question(multiplier: question.multiplier + 1, multiplicant: question.multiplicant).product, isCorrect: false),
      (value: Question(multiplier: question.multiplier + 1, multiplicant: question.multiplicant - 1).product, isCorrect: false)
    ]

    answers.shuffle()

    return answers
  }

}

struct PracticeView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeView().environmentObject(PracticeSettings())
  }
}
