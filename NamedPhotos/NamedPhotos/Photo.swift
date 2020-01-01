//
//  Photo.swift
//  NamedPhotos
//
//  Created by Vitali Tatarintev on 31.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct Photo: Comparable, Identifiable {
  let id = UUID()
  var name: String
  var image: Image

  static func < (lhs: Photo, rhs: Photo) -> Bool {
    lhs.name < rhs.name
  }
}
