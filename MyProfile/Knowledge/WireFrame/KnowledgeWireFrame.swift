//
//  KnowledgeWireFrame.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit

class KnowledgeWireFrame: KnowledgeWireFrameProtocol {

  class func createKnowledgeViewController() -> KnowledgeViewController {
    return KnowledgeViewController.instantiate()
  }

  class func buildKnowledgeModule() -> Any {
    // Generating module components
    let view = createKnowledgeViewController()
    let presenter: KnowledgePresenterProtocol & KnowledgeInteractorOutputProtocol = KnowledgePresenter()
    let interactor: KnowledgeInteractorInputProtocol = KnowledgeInteractor()
    let APIDataManager: KnowledgeAPIDataManagerInputProtocol = KnowledgeAPIDataManager()
    let localDataManager: KnowledgeLocalDataManagerInputProtocol = KnowledgeLocalDataManager()
    let wireFrame: KnowledgeWireFrameProtocol = KnowledgeWireFrame()

    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.APIDataManager = APIDataManager
    interactor.localDatamanager = localDataManager

    return view
  }

}
