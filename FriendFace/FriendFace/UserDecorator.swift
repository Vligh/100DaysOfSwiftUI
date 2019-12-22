//
//  UserDecorator.swift
//  FriendFace
//
//  Created by Vitali Tatarintev on 22.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import Foundation

struct UserDecorator: Identifiable {
  let managedUser: UserMO

  public var initials: String {
    return self.managedUser.name!.split(separator: " ").map { $0.prefix(1) }.joined(separator: "")
  }

  public var id: UUID {
    self.managedUser.id ?? UUID()
  }

  public var isActive: Bool {
    self.managedUser.isActive
  }

  public var name: String {
    self.managedUser.name ?? "Unknown Name"
  }

  public var email: String {
    self.managedUser.email ?? "unknown@email"
  }

  public var address: String {
    self.managedUser.address ?? "Unknown address"
  }

  public var about: String {
    self.managedUser.about ?? ""
  }

  public var age: Int {
    Int(self.managedUser.age)
  }

  public var company: String {
    self.managedUser.company ?? "N/A"
  }

  public var registered: Date {
    self.managedUser.registered ?? Date()
  }

  public var tags: [String] {
    self.managedUser.tags ?? []
  }

  public var friends: [Friend] {
    []
  }

  public var friendsCount: Int {
    return 0
  }

  var formattedRegistrationDate: String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .short

    return dateFormatter.string(from: self.registered)
  }
}
