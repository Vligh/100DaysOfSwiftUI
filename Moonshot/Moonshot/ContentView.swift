//
//  ContentView.swift
//  Moonshot
//
//  Created by Vitali Tatarintev on 25.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
  let missions: [Mission] = Bundle.main.decode("missions.json")

  @State private var showCrewMembers = true

  var body: some View {
    NavigationView {
      List(missions) { mission in
        NavigationLink(destination: MissionView(mission: mission, astronauts: self.missionCrew(mission))) {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(width: 44, height: 44)

          VStack(alignment: .leading) {
            Text(mission.displayName)
              .font(.headline)

            Text(
              self.showCrewMembers ?
                self.crewMembersList(self.missionCrew(mission)) :
                mission.formattedLaunchDate
            )
              .font(.footnote)
          }
        }
      }
      .navigationBarTitle("Moonshot")
      .navigationBarItems(trailing: Button(self.showCrewMembers ? "Show dates" : "Show crew") {
        self.showCrewMembers.toggle()
      })
    }
  }

  func missionCrew(_ mission: Mission) -> [Mission.CrewMember] {
    return Mission.missionCrew(mission: mission, astronauts: self.astronauts)
  }

  func crewMembersList(_ crew: [Mission.CrewMember]) -> String {
    return crew.map { $0.astronaut.name }.joined(separator: "\n")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
