//
//  ContentView.swift
//  FriendFace
//
//  Created by Vitali Tatarintev on 16.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var users: [User] = []

  var body: some View {
    NavigationView {
      List {
        ForEach(users) { user in
          NavigationLink(destination: UserDetailView(user: user, users: self.users)) {
            HStack {
              Text(user.initials)
                .bold()
                .frame(width: 35, height: 35)
                .padding(10)
                .background(Color.gray)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(color: Color.black, radius: 1)

              VStack(alignment: .leading) {
                Text("\(user.name)")

                HStack {
                  Image(systemName: "person.3")
                  Text("\(user.friends.count)")
                    .padding(.trailing, 10)

                  Image(systemName: "envelope")
                  Text(user.email)
                }
                .font(.footnote)
                .foregroundColor(.secondary)
              }
            }

          }
        }
      }
      .navigationBarTitle("Friend Face")
    }
    .onAppear(perform: fetchUsers)
  }

  func fetchUsers() {
    let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "GET"

    URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
        return
      }

      if let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
        self.users = decodedUsers
      } else {
        print("Cannot decode users")
      }
    }.resume()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
