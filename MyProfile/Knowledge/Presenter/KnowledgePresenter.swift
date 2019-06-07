//
//  KnowledgePresenter.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

class KnowledgePresenter: KnowledgePresenterProtocol, KnowledgeInteractorOutputProtocol {

  weak var view: KnowledgeViewProtocol?
  var interactor: KnowledgeInteractorInputProtocol?
  var wireFrame: KnowledgeWireFrameProtocol?
  var skills: [Skill] = []

  func fetchSkills() {
    interactor?.fetchSkills()
  }

  func skillsDidLoad(_ skills: [Skill]) {
    self.skills = skills
    view?.showSkills()
  }

  func onError(message: String) {
    view?.show(error: message)
  }

}
