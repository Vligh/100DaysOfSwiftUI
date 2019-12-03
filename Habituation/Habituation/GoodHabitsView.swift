//
//  GoodHabitsView.swift
//  Habituation
//
//  Created by Vitali Tatarintev on 02.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct GoodHabitsView: View {
  @ObservedObject var goodHabits: GoodHabits

  @State private var addGoodHabitViewVisible = false

  var body: some View {
    NavigationView {
      List(self.goodHabits.items) { goodHabit in
        VStack(alignment: .leading) {
          Text(goodHabit.name)
            .padding(.bottom, 3)

          ForEach(goodHabit.minSteps, id: \.self) { minStep in
            Text(minStep)
              .font(.footnote)
              .padding(.leading)
          }
        }
      }
      .navigationBarTitle("Good Habits")
      .navigationBarItems(trailing: Button(action: {
        self.addGoodHabitViewVisible = true
      }) {
        Image(systemName: "plus")
      })
    }
    .sheet(isPresented: $addGoodHabitViewVisible) {
      AddGoodHabitView(goodHabits: self.goodHabits)
    }
  }
}

struct GoodHabitsView_Previews: PreviewProvider {
  static var previews: some View {
    let goodHabits = GoodHabits()
    goodHabits.items.append(GoodHabit(name: "Learning German", minSteps: ["practice a lesson on Duolingo", "read an article from Deutsche Perfect"]))
    goodHabits.items.append(GoodHabit(name: "Reading books", minSteps: ["read a chapter", "read for 10 minutes"]))

    return GoodHabitsView(goodHabits: goodHabits)
  }
}
