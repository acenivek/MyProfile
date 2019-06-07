//
//  ExperienceLocalDataManager.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit

class ExperienceLocalDataManager: ExperienceLocalDataManagerInputProtocol {

  func loadCompanies(completion: @escaping ([CompanyModel]) -> ()) {
    var companies: [CompanyModel] = []
    let company = CompanyModel(
      image: UIImage(named: "logofb") ,
      companyName: "Facebook",
      companyDate: "2015 - 2019",
      companyPosition: "Developer",
      companyResponsabilities: "Helping with app redesign. Addressed performance in multiple areas. Added image caching, and tuned calls to Parse. App is built upon Parse backend.",
      companyAchivements: "Performed in a Lead developer role on an enterprise iOS app for lululemon. App allows employees to scan store inventory to display real time point of sale, e-commerice, and nightly data warehouse data. Featured remote device configuration by consuming RESTful web services to pull down store specific app settings.")
    companies.append(company)
    completion(companies)
  }
}
