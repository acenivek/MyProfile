//
//  ProfileAPIDataManager.swift
//  CitiMobileApp
//
//   on 05/24/2019.
//  Copyright © 2019 . All rights reserved.
//

import Foundation

class ProfileAPIDataManager: ProfileAPIDataManagerInputProtocol {
  private let networkManager: NetworkManager = NetworkManager()

  func requestImage(urlString: String, completion: @escaping (Data?) -> ()) {
    DispatchQueue.global(qos: .utility).async {
      do {
        guard let URL = URL(string: urlString) else {
          throw ProfileError.invalidURL
        }
        let data = try Data(contentsOf: URL)
        completion(data)
      } catch {
        completion(nil)
      }
    }
  }

  func requestProfile(completion: @escaping (ProfileServiceResult) -> ()) {
    networkManager.requestProfile(completion: completion)
  }
}
