//
//  ProfileProtocols.swift
//  CitiMobileApp
//
//  on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit

protocol ProfileViewProtocol: LoadableViewController, ErrorHandling {
  var presenter: ProfilePresenterProtocol? { get set }
  /**
   * Add here your methods for communication PRESENTER -> VIEW
   */

  func show(profileInformation: ProfileInformation)
  func show(imageData: Data?)
  func buildMail(to address: String)
  func buildCall(to phoneNumber: String)
}

protocol ProfileWireFrameProtocol: class {
  static func buildProfileModule() -> Any 
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */
}

protocol ProfilePresenterProtocol: class {
  var view: ProfileViewProtocol? { get set }
  var interactor: ProfileInteractorInputProtocol? { get set }
  var wireFrame: ProfileWireFrameProtocol? { get set }
  var contactData: ContactData? { get }
  /**
   * Add here your methods for communication VIEW -> PRESENTER
   */

  func viewIsReady()
  func fetchProfile()
  func fetchImage(named: String)
  func callMe()
  func sendMail()
}

protocol ProfileInteractorOutputProtocol: class {
  /**
   * Add here your methods for communication INTERACTOR -> PRESENTER
   */

  func profileDidLoad(profile: ProfileInformation)
  func imageDidLoad(data: Data?)
  func onError(_ error: String)
}

protocol ProfileInteractorInputProtocol: class {
  var presenter: ProfileInteractorOutputProtocol? { get set }
  var APIDataManager: ProfileAPIDataManagerInputProtocol? { get set }
  var localDatamanager: ProfileLocalDataManagerInputProtocol? { get set }
  /**
   * Add here your methods for communication PRESENTER -> INTERACTOR
   */

  func fetchProfile()
  func fetchImage(named: String)
}

protocol ProfileAPIDataManagerInputProtocol: class {
  /**
   * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
   */

  func requestImage(urlString: String, completion: @escaping (Data?) -> ())
  func requestProfile(completion: @escaping (ProfileServiceResult) -> ())
}

protocol ProfileLocalDataManagerInputProtocol: class {
  /**
   * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
   */

  func getProfile(completion: @escaping (ProfileServiceResult) -> ())
}

enum ProfileServiceResult {
  case success(ProfileInformation)
  case error(String)
}

enum ProfileError: Error {
  case fileNotFound
  case invalidURL
}
