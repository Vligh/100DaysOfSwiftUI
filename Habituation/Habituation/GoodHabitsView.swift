//
//  GoodHabitsView.swift
//  Habituation
//
//  Created by Vitali Tatarintev on 02.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct GoodHabitsView: View {
  @Environment(\.presentationMode) var presentationMode
  @ObservedObject var goodHabits: GoodHabits
  @ObservedObject var badHabits: BadHabits
  var badHabit: Habit

  @State private var addGoodHabitViewVisible = false
  @State private var selectedHabitNames = [String]()

  var body: some View {
    NavigationView {
      List {
        ForEach(self.goodHabits.items) { goodHabit in
          HStack {
            VStack(alignment: .leading) {
              Text(goodHabit.name)
                .padding(.bottom, 3)

              ForEach(goodHabit.minSteps, id: \.self) { minStep in
                Text(minStep)
                  .font(.footnote)
                  .padding(.leading)
              }
            }

            Spacer()

            if self.selectedHabitNames.contains(goodHabit.name) {
              Image(systemName: "checkmark")
                .padding(.trailing, 5)
            }
          }
          .onTapGesture {
            withAnimation {
              if let index = self.selectedHabitNames.firstIndex(of: goodHabit.name) {
                self.selectedHabitNames.remove(at: index)
              } else {
                self.selectedHabitNames.append(goodHabit.name)
              }
            }
          }
        }
        .onDelete(perform: removeItems)
      }
      .navigationBarTitle("Good Habits")
      .navigationBarItems(
        leading: Button(action: {
          self.badHabit.alternativeHabits = self.goodHabits.items.filter { self.selectedHabitNames.contains($0.name) }
          self.badHabit.reinsert(into: self.badHabits)

          self.presentationMode.wrappedValue.dismiss()
        }) {
          Text("Save")
        },
        trailing: Button(action: {
          self.addGoodHabitViewVisible = true
        }) {
          Image(systemName: "plus")
      })
      .onAppear(perform: {
        self.selectedHabitNames = self.badHabit.alternativeHabits.map { $0.name }
      })
    }
    .sheet(isPresented: $addGoodHabitViewVisible) {
      AddGoodHabitView(goodHabits: self.goodHabits)
    }
  }

  func removeItems(at offsets: IndexSet) {
    self.goodHabits.items.remove(atOffsets: offsets)
  }
}

struct GoodHabitsView_Previews: PreviewProvider {
  static var previews: some View {
    let practiceGerman = GoodHabit(name: "Practice German", minSteps: ["practice a lesson on Duolingo", "read an article from Deutsche Perfect"])
    let readingBooks = GoodHabit(name: "Reading books", minSteps: ["read a chapter", "read for 10 minutes"])

    let goodHabits = GoodHabits()
    goodHabits.items.append(practiceGerman)
    goodHabits.items.append(readingBooks)

    let badHabit = Habit(name: "Playing video games", minStep: "play for 30 minutes", alternativeHabits: [practiceGerman])

    return GoodHabitsView(goodHabits: goodHabits, badHabits: BadHabits(), badHabit: badHabit)
  }
}
