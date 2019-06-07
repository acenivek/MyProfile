//
//  ExperienceWireFrame.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit

class ExperienceWireFrame: ExperienceWireFrameProtocol {

  class func createExperienceViewController() -> ExperienceViewController {
    return ExperienceViewController.instantiate()
  }

  class func buildExperienceModule() -> Any {
    // Generating module components
    let view = createExperienceViewController()
    let presenter: ExperiencePresenterProtocol & ExperienceInteractorOutputProtocol = ExperiencePresenter()
    let interactor: ExperienceInteractorInputProtocol = ExperienceInteractor()
    let APIDataManager: ExperienceAPIDataManagerInputProtocol = ExperienceAPIDataManager()
    let localDataManager: ExperienceLocalDataManagerInputProtocol = ExperienceLocalDataManager()
    let wireFrame: ExperienceWireFrameProtocol = ExperienceWireFrame()

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
