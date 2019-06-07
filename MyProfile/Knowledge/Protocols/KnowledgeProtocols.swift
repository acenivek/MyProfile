//
//  KnowledgeProtocols.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit

protocol KnowledgeViewProtocol: LoadableViewController, ErrorHandling {
  var presenter: KnowledgePresenterProtocol? { get set }
  /**
   * Add here your methods for communication PRESENTER -> VIEW
   */
  func showSkills()
}

protocol KnowledgeWireFrameProtocol: class {
  static func buildKnowledgeModule() -> Any
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */
}

protocol KnowledgePresenterProtocol: class {
  var view: KnowledgeViewProtocol? { get set }
  var interactor: KnowledgeInteractorInputProtocol? { get set }
  var wireFrame: KnowledgeWireFrameProtocol? { get set }
  var skills: [Skill] { get }
  /**
   * Add here your methods for communication VIEW -> PRESENTER
   */
  func fetchSkills()
}

protocol KnowledgeInteractorOutputProtocol: class {
  /**
   * Add here your methods for communication INTERACTOR -> PRESENTER
   */

  func skillsDidLoad(_ skills: [Skill])
  func onError(message: String)
}

protocol KnowledgeInteractorInputProtocol: class {
  var presenter: KnowledgeInteractorOutputProtocol? { get set }
  var APIDataManager: KnowledgeAPIDataManagerInputProtocol? { get set }
  var localDatamanager: KnowledgeLocalDataManagerInputProtocol? { get set }
  /**
   * Add here your methods for communication PRESENTER -> INTERACTOR
   */
  func fetchSkills()
}

protocol KnowledgeAPIDataManagerInputProtocol: class {
  /**
   * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
   */
}

protocol KnowledgeLocalDataManagerInputProtocol: class {
  /**
   * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
   */

  func loadSkills(completion: @escaping (SkillsResult) -> ())
}

enum SkillsResult {
  case success([Skill])
  case error
}
