//
//  FriendList.swift
//  FriendFace
//
//  Created by Vitali Tatarintev on 23.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import CoreData
import SwiftUI

struct FriendList<T: NSManagedObject, Content: View>: View {
  var fetchRequest: FetchRequest<T>
  var friends: FetchedResults<T> { fetchRequest.wrappedValue }
  let content: (T) -> Content

  var body: some View {
    ForEach(fetchRequest.wrappedValue, id: \.self) { friend in
      self.content(friend)
    }
  }

  init(friendIds: [UUID], @ViewBuilder content: @escaping (T) -> Content) {
    fetchRequest = FetchRequest<T>(
      entity: T.entity(),
      sortDescriptors: [],
      predicate: NSPredicate(format: "id IN %@", friendIds)
    )

    self.content = content
  }
}
