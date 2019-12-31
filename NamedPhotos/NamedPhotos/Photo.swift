//
//  Photo.swift
//  NamedPhotos
//
//  Created by Vitali Tatarintev on 31.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import Foundation

struct Photo: Comparable {
  var name: String

  static func < (lhs: Photo, rhs: Photo) -> Bool {
    lhs.name < rhs.name
  }
}
