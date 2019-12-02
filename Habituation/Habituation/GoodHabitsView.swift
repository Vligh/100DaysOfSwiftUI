//
//  GoodHabitsView.swift
//  Habituation
//
//  Created by Vitali Tatarintev on 02.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct GoodHabitsView: View {
  let goodHabits = [
    GoodHabit(name: "Learning German", minSteps: ["practice a lesson on Duolingo", "read an article from Deutsche Perfect"]),
    GoodHabit(name: "Reading books", minSteps: ["read a chapter", "read for 10 minutes"])
  ]

  var body: some View {
    NavigationView {
      List(self.goodHabits) { goodHabit in
        VStack(alignment: .leading) {
          Text(goodHabit.name)

          ForEach(goodHabit.minSteps, id: \.self) { minStep in
            Text(minStep)
              .font(.footnote)
              .padding(.leading)
          }
        }
      }
      .navigationBarTitle("Good Habits")
    }
  }
}

struct GoodHabitsView_Previews: PreviewProvider {
  static var previews: some View {
    GoodHabitsView()
  }
}
