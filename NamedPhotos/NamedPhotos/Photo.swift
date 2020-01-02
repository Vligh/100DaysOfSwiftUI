//
//  Photo.swift
//  NamedPhotos
//
//  Created by Vitali Tatarintev on 31.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI
import UIKit

struct Photo: Comparable, Identifiable, Codable {
  enum CodingKeys: CodingKey {
    case id, name, image
  }

  var id = UUID()
  var name: String
  var uiImage: UIImage
  var image: Image {
    Image(uiImage: uiImage)
  }

  init(name: String, uiImage: UIImage) {
    self.name = name
    self.uiImage = uiImage
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(UUID.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    let data = try container.decode(Data.self, forKey: .image)
    uiImage = UIImage(data: data)!
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(name, forKey: .name)
    let imageData = uiImage.jpegData(compressionQuality: 0.8)
    try container.encode(imageData, forKey: .image)
  }

  static func < (lhs: Photo, rhs: Photo) -> Bool {
    lhs.name < rhs.name
  }
}
