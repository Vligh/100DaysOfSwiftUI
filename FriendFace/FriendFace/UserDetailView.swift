//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Vitali Tatarintev on 17.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct UserDetailView: View {
  let user: User

  var body: some View {
    GeometryReader { geometry in
      VStack {
        Text("JD")
        Text(self.user.isActive ? "active" : "inactive")
          .foregroundColor(self.user.isActive ? Color.green : Color.red)

        VStack(alignment: .leading) {
          Section {
            HStack {
              Image(systemName: "envelope")
              Text(self.user.email)
              Spacer()
            }

            Text("\(self.user.age) years old")
            Text("Works at \(self.user.company)")
            Text("Lives in \(self.user.address)")
            Text("Registered at \(self.user.registered)")
          }
          .padding(.horizontal)

          Section {
            Text(self.user.about)
          }
          .padding()

          Section {
            Text(self.user.tags.joined(separator: ", "))
          }
          .padding()
        }
        .padding(.bottom, 30)


        Section(header: Text("Friends")) {
          List {
            ForEach(self.user.friends) { friend in
              Text(friend.name)
            }
          }
        }
      }
    }
    .navigationBarTitle(Text(self.user.name), displayMode: .inline)
  }
}

struct UserDetailView_Previews: PreviewProvider {
  static var user = User(
    isActive: false,
    name: "John Doe",
    age: 30,
    company: "N/A",
    email: "john@doe.com",
    address: "Unknown",
    about: "That is Joe",
    registered: "2015-11-10T01:47:18-00:00",
    tags: ["tag1", "tag2"],
    friends: [
      Friend(name: "Bob Doe"),
      Friend(name: "Alice Undoe")
    ]
  )

  static var previews: some View {
    UserDetailView(user: user)
  }
}
