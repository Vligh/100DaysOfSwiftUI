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
      ScrollView(.vertical) {
        VStack {
          Text(self.user.initials)
            .font(.largeTitle)
            .bold()
            .frame(width: 50, height: 50)
            .padding(30)
            .background(self.user.isActive ? Color.green : Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .shadow(color: Color.black, radius: 1)

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

            Section {
              HStack {
                Image(systemName: "person.3")
                Text("Friends")
              }
              .font(.headline)

              ForEach(self.user.friends) { friend in
                HStack {
                  Text(friend.initials)
                    .font(.footnote)
                    .bold()
                    .frame(width: 30, height: 30)
                    .padding(5)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black, radius: 1)

                  Text(friend.name)
                }
                .padding(.bottom, 5)
              }
            }
            .padding(.horizontal)
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
      Friend(name: "Alice Undoe"),
      Friend(name: "Wyatt Ward")
    ]
  )

  static var previews: some View {
    UserDetailView(user: user)
  }
}
