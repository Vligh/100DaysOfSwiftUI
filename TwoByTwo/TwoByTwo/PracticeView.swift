//
//  PracticeView.swift
//  TwoByTwo
//
//  Created by Vitali Tatarintev on 19.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

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

      Text("Practice screen")
      Text("Practice range: \(self.settings.practiceRange)")
      Text("Selected number of questions \(self.settings.selectedNumberOfQuestions)")
      Text("That makes \(self.totalQuestions) questions in total")

      Spacer()

    }
  }
}

struct PracticeView_Previews: PreviewProvider {
  static var previews: some View {
    PracticeView().environmentObject(PracticeSettings())
  }
}
