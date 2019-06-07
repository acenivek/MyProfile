//
//  LoadableViewController.swift
//  MyProfile
//
//   on 5/24/19.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit

protocol LoadableViewController: class {
  static var storyboardFileName: String { get }
  static var storyboardID: String { get }
}

extension LoadableViewController {
  static var storyboardID: String {
    return String(describing: self)
  }
}

extension LoadableViewController where Self: UIViewController {
  static func instantiate() -> Self {
    guard let viewController = UIStoryboard(name: storyboardFileName, bundle: .main).instantiateViewController(withIdentifier: storyboardID) as? Self else {
      fatalError("The viewController '\(self.storyboardID)' of '\(storyboardFileName)' is not of class '\(self)'")
    }
    return viewController
  }
}
