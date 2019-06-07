import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
  associatedtype EndPoint: Routable
  func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
}

class Router<EndPoint: Routable>: NetworkRouter {

  func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
    let session = URLSession.shared
    var task: URLSessionTask?
    do {
      let request = try self.buildRequest(from: route)
      task = session.dataTask(with: request, completionHandler: { data, response, error in
        completion(data, response, error)
      })
    }catch {
      completion(nil, nil, error)
    }
    task?.resume()
  }

  fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
    var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                             cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                             timeoutInterval: 10.0)

    request.httpMethod = route.httpMethod.rawValue
    switch route.task {
    case .request:
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    return request

  }

}

