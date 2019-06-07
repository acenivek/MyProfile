//
//  ProfileInteractor.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

class ProfileInteractor: ProfileInteractorInputProtocol {

  weak var presenter: ProfileInteractorOutputProtocol?
  var APIDataManager: ProfileAPIDataManagerInputProtocol?
  var localDatamanager: ProfileLocalDataManagerInputProtocol?

  func fetchProfile() {
    APIDataManager?.requestProfile { [weak self] result in
      DispatchQueue.main.async {
        switch result {
        case .success(let profile):
          self?.presenter?.profileDidLoad(profile: profile)
        case .error(let message):
          self?.presenter?.onError(message)
        }
      }
    }
  }

  func fetchImage(named: String) {
    APIDataManager?.requestImage(urlString: named) { [weak self] imageData in
      DispatchQueue.main.async {
        self?.presenter?.imageDidLoad(data: imageData)
      }
    }
  }

}
