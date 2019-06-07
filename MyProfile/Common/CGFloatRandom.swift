//
//  CGFloatRandom.swift
//  MyProfile
//
//   on 5/24/19.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
  static func random() -> CGFloat {
    return CGFloat(arc4random()) / CGFloat(UInt32.max)
  }
}
