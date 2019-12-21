//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Vitali Tatarintev on 17.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct LabeledText: View {
  var label: String
  var text: String
  var icon: String? = nil

  var body: some View {
    Section {
      HStack {
        if icon != nil {
          Image(systemName: icon!)
        }
        Text(self.label).font(.subheadline)
      }
      Text(self.text)
      Divider()
    }
  }
}

struct Tag: View {
  var text: String

  var body: some View {
    Text(self.text)
      .font(.subheadline)
      .padding(8)
      .padding(.horizontal, 10)
      .background(Color.purple)
      .foregroundColor(.white)
      .clipShape(RoundedRectangle(cornerRadius: 15))
  }
}

struct UserDetailView: View {
  let user: User
  let users: [User]

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
              LabeledText(label: "Email", text: self.user.email, icon: "envelope")
              LabeledText(label: "Age", text: "\(self.user.age)")
              LabeledText(label: "Company", text: self.user.company)
              LabeledText(label: "Address", text: self.user.address)
              LabeledText(label: "Registration date", text: self.user.formattedRegistrationDate)
              LabeledText(label: "About", text: self.user.about)
            }

            Section {
              HStack {
                Image(systemName: "tag")
                Text("Tags")
              }
              .font(.headline)

              VStack(alignment: .leading) {
                ForEach(self.user.tags, id: \.self) { tag in
                  Tag(text: tag)
                }
                .padding(.bottom, 5)
              }
              .padding(.bottom, 10)
            }

            Section {
              HStack {
                Image(systemName: "person.3")
                Text("Friends")
              }
              .font(.headline)

              ForEach(self.user.friends) { friend in
                NavigationLink(destination: UserDetailView(user: self.findUserByFiendId(friend.id), users: self.users)) {
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
                      .foregroundColor(.primary)
                  }
                  .padding(.bottom, 5)
                }
              }
            }
          }
        }
      }
      .padding()
    }
    .navigationBarTitle(Text(self.user.name), displayMode: .inline)
  }

  func findUserByFiendId(_ friendId: UUID) -> User {
    self.users.first(where: { $0.id.uuidString == friendId.uuidString })!
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
    tags: ["tag1", "tag2", "tag333", "tag4", "tag5555555", "tag6", "tag7"],
    friends: [
      Friend(name: "Bob Doe"),
      Friend(name: "Alice Undoe"),
      Friend(name: "Wyatt Ward")
    ]
  )

  static var previews: some View {
    UserDetailView(user: user, users: [user])
  }
}
