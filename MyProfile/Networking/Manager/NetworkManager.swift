//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Malcolm Kumwenda on 2018/03/11.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import Foundation

enum NetworkResponse:String {
  case success
  case authenticationError = "You need to be authenticated first."
  case badRequest = "Bad request"
  case outdated = "The url you requested is outdated."
  case failed = "Network request failed."
  case noData = "Response returned with no data to decode."
  case unableToDecode = "We could not decode the response."
}

enum Result<String>{
  case success
  case failure(String)
}

struct NetworkManager {
  static let environment : NetworkEnvironment = .production
  let router = Router<ProfileAPI>()

  func requestProfile(completion:@escaping (ProfileServiceResult) -> ()) {

    router.request(.profile) { (data, response, error) in

      if error != nil {
        completion(.error("Please check your network connection."))
      } else if let response = response as? HTTPURLResponse {
        let result = self.handleNetworkResponse(response)
        switch result {
        case .success:
          guard let responseData = data else {
            completion(.error("No data"))
            return
          }
          do {
            let profileInformation = try JSONDecoder().decode(ProfileInformation.self, from: responseData)
            completion(.success(profileInformation))

          }catch {
            completion(.error("Parser error"))
          }
        case .failure(let error):
          completion(.error(error))
        }
      }

    }

  }

  
  fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
    switch response.statusCode {
    case 200...299: return .success
    case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
    case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
    case 600: return .failure(NetworkResponse.outdated.rawValue)
    default: return .failure(NetworkResponse.failed.rawValue)
    }
  }
}
