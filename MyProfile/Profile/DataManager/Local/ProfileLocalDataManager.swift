//
//  ProfileLocalDataManager.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

class ProfileLocalDataManager: ProfileLocalDataManagerInputProtocol {
  func getProfile(completion: @escaping (ProfileServiceResult) -> ()) {
    DispatchQueue.global(qos: .utility).async { [unowned self] in
      do {
        let profileInformation: ProfileInformation
        let contactData: ContactData
        contactData = ContactData(name: "Juan Perez", phoneNumber: "55 3355 6677", mail: "juan.perez@mail.com")
        let summary: String
        try summary = self.readSummary()
        let urlString = "https://toppng.com/public/uploads/preview/happy-person-11545691815kaxm4xdlwj.png"
        profileInformation = ProfileInformation(imageURLString: urlString, contactData: contactData, summary: summary)
        DispatchQueue.main.async {
          completion(.success(profileInformation))
        }
      } catch {
        DispatchQueue.main.async {
          completion(.error(error.localizedDescription))
        }
      }
    }
  }

  private func readSummary() throws -> String {
    guard let path = Bundle.main.path(forResource: "Summary", ofType: "txt") else {
      throw ProfileError.fileNotFound
    }
    let contentFile = try String(contentsOfFile: path)
    return contentFile
  }
}
