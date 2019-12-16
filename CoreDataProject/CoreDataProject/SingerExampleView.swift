//
//  SingerExampleView.swift
//  CoreDataProject
//
//  Created by Vitali Tatarintev on 15.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct SingerExampleView: View {
  @Environment(\.managedObjectContext) var moc
  @State var lastNameFilter = "A"

  var body: some View {
    VStack {
      SingerFilteredList(
        filterKey: "lastName",
        filterValue: lastNameFilter,
        sortDescriptors: [NSSortDescriptor(keyPath: \Singer.firstName, ascending: false)]
      ) { (singer: Singer) in
        Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
      }

      Button("Add Examples") {
        let taylor = Singer(context: self.moc)
        taylor.firstName = "Taylor"
        taylor.lastName = "Swift"

        let ed = Singer(context: self.moc)
        ed.firstName = "Ed"
        ed.lastName = "Sheeran"

        let adele = Singer(context: self.moc)
        adele.firstName = "Adele"
        adele.lastName = "Adkins"

        try? self.moc.save()
      }

      Button("Show A") {
        self.lastNameFilter = "A"
      }

      Button("Show S") {
        self.lastNameFilter = "S"
      }
    }
  }
}

struct SingerExampleView_Previews: PreviewProvider {
  static var previews: some View {
    SingerExampleView()
  }
}
