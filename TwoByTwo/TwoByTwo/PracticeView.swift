//
//  PracticeView.swift
//  TwoByTwo
//
//  Created by Vitali Tatarintev on 19.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct AnswerButton: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.title)
      .frame(width: 40)
      .padding(35)
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
  @State private var buttonColors = Array(repeating: Color.orange, count: 4)
  @State private var buttonDidTap = false

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

            Button("\(self.currentAnswerSuggestions[0].value)") {
              self.tapAnswerButton(index: 0)
            }
            .modifier(AnswerButton())
            .background(self.buttonColors[0])

            Spacer()

            Button("\(self.currentAnswerSuggestions[1].value)") {
              self.tapAnswerButton(index: 1)
            }
            .modifier(AnswerButton())
            .background(self.buttonColors[1])

            Spacer()
          }
          .padding(.bottom, 50)

          HStack {
            Spacer()

            Button("\(self.currentAnswerSuggestions[2].value)") {
              self.tapAnswerButton(index: 2)
            }
            .modifier(AnswerButton())
            .background(self.buttonColors[2])

            Spacer()

            Button("\(self.currentAnswerSuggestions[3].value)") {
              self.tapAnswerButton(index: 3)
            }
            .modifier(AnswerButton())
            .background(self.buttonColors[3])

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
        self.buttonDidTap = false
        self.buttonColors = Array(repeating: Color.orange, count: 4)
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
    let diff = question.multiplier == 0 ? 1 : question.multiplier

    var answers = [
      (value: question.product, isCorrect: true),
      (value: question.product + diff, isCorrect: false),
      (value: question.product - diff, isCorrect: false),
      (value: question.product + diff + 1, isCorrect: false)
    ]

    answers.shuffle()

    return answers
  }

  func calculateButtonColor(buttonIndex: Int) -> Color {
    guard self.buttonDidTap else { return Color.orange }

    guard self.currentAnswerSuggestions[buttonIndex].isCorrect else { return Color.red }

    return Color.green
  }

  func tapAnswerButton(index: Int) {
    self.nextButtonDisabled = false
    self.buttonDidTap = true
    self.buttonColors[index] = self.calculateButtonColor(buttonIndex: index)
  }
}

struct PracticeView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeView().environmentObject(PracticeSettings())
  }
}
