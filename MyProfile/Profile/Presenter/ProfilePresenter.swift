//
//  ProfilePresenter.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

class ProfilePresenter: ProfilePresenterProtocol, ProfileInteractorOutputProtocol {
  private(set) var contactData: ContactData?
  weak var view: ProfileViewProtocol?
  var interactor: ProfileInteractorInputProtocol?
  var wireFrame: ProfileWireFrameProtocol?

  init() {}

  func viewIsReady() {
    fetchProfile()
  }

  func fetchProfile() {
    interactor?.fetchProfile()
  }

  func fetchImage(named: String) {
    interactor?.fetchImage(named: named)
  }

  func profileDidLoad(profile: ProfileInformation) {
    view?.show(profileInformation: profile)
    self.contactData = profile.contactData
  }

  func imageDidLoad(data: Data?) {
    view?.show(imageData: data)
  }

  func onError(_ error: String) {
    view?.show(error: error)
  }

  func callMe() {
    guard let contactDataNotNil = self.contactData else {
      view?.show(error: "Information not available")
      return
    }
    view?.buildCall(to: contactDataNotNil.phoneNumber)
  }

  func sendMail() {
    guard let contactDataNotNil = self.contactData else {
      view?.show(error: "Information not available")
      return
    }
    view?.buildMail(to: contactDataNotNil.mail)
  }
}
