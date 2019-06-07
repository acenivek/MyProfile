//
//  ColorRandom.swift
//  MyProfile
//
//   on 5/24/19.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  static func random() -> UIColor {
    return UIColor(red:   .random(),
                   green: .random(),
                   blue:  .random(),
                   alpha: 1.0)
  }
}
