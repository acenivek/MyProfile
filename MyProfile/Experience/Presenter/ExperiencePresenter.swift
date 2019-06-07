//
//  ExperiencePresenter.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

class ExperiencePresenter: ExperiencePresenterProtocol, ExperienceInteractorOutputProtocol {
  weak var view: ExperienceViewProtocol?
  var interactor: ExperienceInteractorInputProtocol?
  var wireFrame: ExperienceWireFrameProtocol?
  var companies: [CompanyModel] = []

  init() {}

  func viewIsReady() {
    fetchCompanies()
  }

  func fetchCompanies() {
    interactor?.getCompanyArray()
  }

  func companiesDidLoad(companies: [CompanyModel]) {
    self.companies = companies
    view?.showCompanies()
  }
}
