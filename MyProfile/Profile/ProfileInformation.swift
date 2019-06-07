//
//  ProfileInformation.swift
//  MyProfile
//
//   on 5/24/19.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

struct ProfileInformation: Codable {
  let imageURLString: String
  let contactData: ContactData
  let summary: String
}
