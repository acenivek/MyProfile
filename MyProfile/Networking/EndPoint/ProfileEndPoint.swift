//
//  MovieEndPoint.swift
//  NetworkLayer
//
//  Created by Malcolm Kumwenda on 2018/03/07.
//  Copyright © 2018 Malcolm Kumwenda. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum ProfileAPI {
    case profile
}

extension ProfileAPI: Routable {

  var environmentBaseURL : String {
    switch NetworkManager.environment {
    case .production: return "https://gist.githubusercontent.com/yavier/"
    case .qa: return "https://gist.githubusercontent.com/yavier/"
    case .staging: return "https://gist.githubusercontent.com/yavier/"
    }
  }

  var baseURL: URL {
    guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
    return url
  }

  var path: String {
    switch self {
    case .profile:
      return "219d99d837fb4f8689adec0acead8546/raw/9a149a6f90896f041cc3b7ad59dd422a6c45d6b1/profile.json"
    }
  }

  var httpMethod: HTTPMethod {
    return .get
  }

  var task: HTTPTask {
    switch self {
    case .profile:
      return .request
    }
  }

  var headers: HTTPHeaders? {
    return nil
  }
}


