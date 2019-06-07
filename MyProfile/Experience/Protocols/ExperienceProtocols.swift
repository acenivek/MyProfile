//
//  ExperienceProtocols.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

protocol ExperienceViewProtocol: LoadableViewController {
  var presenter: ExperiencePresenterProtocol? { get set }
  /**
   * Add here your methods for communication PRESENTER -> VIEW
   */
  func showCompanies()
}

protocol ExperienceWireFrameProtocol: class {
  static func buildExperienceModule() -> Any
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */
}

protocol ExperiencePresenterProtocol: class {
  var view: ExperienceViewProtocol? { get set }
  var interactor: ExperienceInteractorInputProtocol? { get set }
  var wireFrame: ExperienceWireFrameProtocol? { get set }
  var companies: [CompanyModel] { get set }
  /**
   * Add here your methods for communication VIEW -> PRESENTER
   */

  func viewIsReady()
  func fetchCompanies()
}

protocol ExperienceInteractorOutputProtocol: class {
  /**
   * Add here your methods for communication INTERACTOR -> PRESENTER
   */

  func companiesDidLoad(companies: [CompanyModel])
}

protocol ExperienceInteractorInputProtocol: class {
  var presenter: ExperienceInteractorOutputProtocol? { get set }
  var APIDataManager: ExperienceAPIDataManagerInputProtocol? { get set }
  var localDatamanager: ExperienceLocalDataManagerInputProtocol? { get set }
  /**
   * Add here your methods for communication PRESENTER -> INTERACTOR
   */
  func getCompanyArray()
}

protocol ExperienceAPIDataManagerInputProtocol: class {
  /**
   * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
   */
}

protocol ExperienceLocalDataManagerInputProtocol: class {
  /**
   * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
   */

  func loadCompanies(completion: @escaping ([CompanyModel]) -> ())
}
