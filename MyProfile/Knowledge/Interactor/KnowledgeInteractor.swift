//
//  KnowledgeInteractor.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

class KnowledgeInteractor: KnowledgeInteractorInputProtocol {

  weak var presenter: KnowledgeInteractorOutputProtocol?
  var APIDataManager: KnowledgeAPIDataManagerInputProtocol?
  var localDatamanager: KnowledgeLocalDataManagerInputProtocol?

  func fetchSkills() {
    localDatamanager?.loadSkills { result in
      switch result {
      case .success(let skills):
        self.presenter?.skillsDidLoad(skills)
      case .error:
        self.presenter?.onError(message: "Communication error!")
      }
    }
  }

}
