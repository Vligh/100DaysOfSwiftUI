//
//  Photo.swift
//  NamedPhotos
//
//  Created by Vitali Tatarintev on 31.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit

struct Photo: Comparable, Identifiable, Codable {
  enum CodingKeys: CodingKey {
    case id, name, image, latitude, longitude
  }

  var id = UUID()
  var name: String
  var uiImage: UIImage
  var latitude: CLLocationDegrees?
  var longitude: CLLocationDegrees?

  var image: Image {
    Image(uiImage: uiImage)
  }

  var coordinate: CLLocationCoordinate2D? {
    if latitude == nil || longitude == nil { return nil }

    return CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
  }

  init(name: String, uiImage: UIImage, latitude: CLLocationDegrees?, longitude: CLLocationDegrees?) {
    self.name = name
    self.uiImage = uiImage
    self.latitude = latitude
    self.longitude = longitude
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(UUID.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)

    let data = try container.decode(Data.self, forKey: .image)
    uiImage = UIImage(data: data)!

    latitude = try container.decodeIfPresent(CLLocationDegrees.self, forKey: .latitude)
    longitude = try container.decodeIfPresent(CLLocationDegrees.self, forKey: .longitude)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(name, forKey: .name)

    let imageData = uiImage.jpegData(compressionQuality: 0.8)
    try container.encode(imageData, forKey: .image)

    try container.encode(latitude, forKey: .latitude)
    try container.encode(longitude, forKey: .longitude)
  }

  static func < (lhs: Photo, rhs: Photo) -> Bool {
    lhs.name < rhs.name
  }
}
