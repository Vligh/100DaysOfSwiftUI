//
//  User.swift
//  FriendFace
//
//  Created by Vitali Tatarintev on 16.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import Foundation

struct User: Codable {
  var id = UUID()
  var isActive: Bool
  var name: String
  var age: Int
  var company: String
  var email: String
  var address: String
  var about: String
  var registered: Date
  var tags: [String]
  var friends: [Friend]
}
