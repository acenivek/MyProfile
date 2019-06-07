//
//  ProfileWireFrame.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation
import UIKit

class ProfileWireFrame: ProfileWireFrameProtocol {

  class func createProfileViewController() -> ProfileViewController {
    return ProfileViewController.instantiate()
  }

  class func buildProfileModule() -> Any {
    // Generating module components
    let view = createProfileViewController()
    let presenter: ProfilePresenterProtocol & ProfileInteractorOutputProtocol = ProfilePresenter()
    let interactor: ProfileInteractorInputProtocol = ProfileInteractor()
    let APIDataManager: ProfileAPIDataManagerInputProtocol = ProfileAPIDataManager()
    let localDataManager: ProfileLocalDataManagerInputProtocol = ProfileLocalDataManager()
    let wireFrame: ProfileWireFrameProtocol = ProfileWireFrame()

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
