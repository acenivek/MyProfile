//
//  ExperienceInteractor.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

class ExperienceInteractor: ExperienceInteractorInputProtocol {

  weak var presenter: ExperienceInteractorOutputProtocol?
  var APIDataManager: ExperienceAPIDataManagerInputProtocol?
  var localDatamanager: ExperienceLocalDataManagerInputProtocol?

  func getCompanyArray() {
    localDatamanager?.loadCompanies { companies in
      self.presenter?.companiesDidLoad(companies: companies)
    }
  }
}
