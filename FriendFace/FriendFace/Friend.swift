//
//  Friend.swift
//  FriendFace
//
//  Created by Vitali Tatarintev on 16.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import Foundation

struct Friend: Codable, Identifiable {
  var id = UUID()
  var name: String

  var initials: String {
    return name.split(separator: " ").map { $0.prefix(1) }.joined(separator: "")
  }
}
