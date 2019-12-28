//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Vitali Tatarintev on 28.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
  public var wrappedTitle: String {
    get {
      self.title ?? "Unknown value"
    }

    set {
      title = newValue
    }
  }

  public var wrappedSubtitle: String {
    get {
      self.subtitle ?? "Unknown value"
    }

    set {
      subtitle = newValue
    }
  }
}
