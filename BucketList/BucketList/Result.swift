//
//  Result.swift
//  BucketList
//
//  Created by Vitali Tatarintev on 29.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import Foundation

struct Result: Codable {
  let query: Query
}

struct Query: Codable {
  let pages: [Int: Page]
}

struct Page: Codable {
  let pageid: Int
  let title: String
  let terms: [String: [String]]?

  var description: String {
    terms?["description"]?.first ?? "No further information"
  }
}
