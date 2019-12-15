//
//  SingerFilteredList.swift
//  CoreDataProject
//
//  Created by Vitali Tatarintev on 15.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import CoreData
import SwiftUI

struct SingerFilteredList: View {
  var fetchRequest: FetchRequest<Singer>
  var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }

  var body: some View {
    List(fetchRequest.wrappedValue, id: \.self) { singer in
      Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
    }
  }

  init(filter: String) {
    fetchRequest = FetchRequest<Singer>(
      entity: Singer.entity(),
      sortDescriptors: [],
      predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter)
    )
  }
}
