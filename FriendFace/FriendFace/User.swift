//
//  User.swift
//  FriendFace
//
//  Created by Vitali Tatarintev on 16.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {
  var id = UUID()
  var isActive: Bool
  var name: String
  var age: Int
  var company: String
  var email: String
  var address: String
  var about: String
  var registered: String
  var tags: [String]
  var friends: [Friend]

  var initials: String {
    return name.split(separator: " ").map { $0.prefix(1) }.joined(separator: "")
  }

  var registrationDate: Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

    return dateFormatter.date(from: self.registered) ?? Date()
  }

  var formattedRegistrationDate: String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .short

    return dateFormatter.string(from: self.registrationDate)
  }
}
