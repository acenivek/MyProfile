//
//  AlertView.swift
//  MyProfile
//
//   on 5/24/19.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit

protocol ErrorHandling {
  func show(error: String)
}

extension ErrorHandling where Self: UIViewController {
  func show(error: String) {
    let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Accept", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
}
