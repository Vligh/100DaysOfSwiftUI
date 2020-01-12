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
          GeometryReader { imageGeometry in
            Image(self.mission.image)
              .resizable()
              .scaledToFit()
              .scaleEffect(self.calculateImageScale(imageGeometry, geometry))
          }
          .frame(width: geometry.size.width * 0.7, height: geometry.size.width * 0.7, alignment: .center)

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

  func calculateImageScale(_ imageGeometry: GeometryProxy, _ initialGeometry: GeometryProxy) -> CGFloat {
    let currentMinY = imageGeometry.frame(in: .global).minY
    let initialMinY = initialGeometry.frame(in: .global).minY

    if currentMinY >= initialMinY {
      return 1
    }

    return 0.8 + currentMinY / 700
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
