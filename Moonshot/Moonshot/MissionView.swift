//
//  MissionView.swift
//  Moonshot
//
//  Created by Vitali Tatarintev on 25.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct MissionView: View {
  let mission: Mission
  let astronauts: [Mission.CrewMember]

  var body: some View {
    GeometryReader { geometry in
      ScrollView(.vertical) {
        VStack {
          Image(self.mission.image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: geometry.size.width * 0.7)
            .padding(.top)

          Text(self.mission.formattedLaunchDate)
            .padding()

          Text(self.mission.description)
            .padding()

          ForEach(self.astronauts, id: \.role) { crewMember in
            NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
              HStack {
                Image(crewMember.astronaut.id)
                  .resizable()
                  .frame(width: 83, height: 60)
                  .clipShape(Capsule())
                  .overlay(Capsule().stroke(Color.primary, lineWidth: 1))

                VStack(alignment: .leading) {
                  Text(crewMember.astronaut.name)
                    .font(.headline)

                  Text(crewMember.role)
                    .foregroundColor(.secondary)
                }

                Spacer()
              }
              .padding(.horizontal)
            }
            .buttonStyle(PlainButtonStyle())
          }

          Spacer(minLength: 25)
        }
      }
    }
  }
}

struct MissionView_Previews: PreviewProvider {
  static let missions: [Mission] = Bundle.main.decode("missions.json")
  static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
  static let crew = Mission.missionCrew(mission: missions[0], astronauts: astronauts)

  static var previews: some View {
    MissionView(mission: missions[0], astronauts: crew)
  }
}
