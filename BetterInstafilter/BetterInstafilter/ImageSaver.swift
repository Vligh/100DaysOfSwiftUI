//
//  ImageSaver.swift
//  BetterInstafilter
//
//  Created by Vitali Tatarintev on 26.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import UIKit

class ImageSaver: NSObject {
  var successHandler: (() -> Void)?
  var errorHandler: ((Error) -> Void)?

  func writeToPhotoAlbum(image: UIImage) {
    UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
  }

  @objc func saveError(_ image: UIImage, didFishishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
    if let error = error {
      errorHandler?(error)
    } else {
      successHandler?()
    }
  }
}
