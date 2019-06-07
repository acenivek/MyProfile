import XCTest
@testable import MyProfile

class MyProfileTests: XCTestCase {

  private let networkManager: NetworkManager = NetworkManager()
  private let router = Router<ProfileAPI>()

  // MARK: - Super class methods
  override func setUp() {
    continueAfterFailure = false
  }

  // MARK: - Tests methods
  func testProfileResponse() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify profile JSON response", comment: ""))
    networkManager.requestProfile { (profileServiceResult) in
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 3.0)
  }

  func testProfileIntegrity() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify profile JSON integrity", comment: ""))

    networkManager.requestProfile { (profileServiceResult) in
      switch profileServiceResult {
      case .success:
         expectation.fulfill()
      case .error:
        XCTFail()
      }
    }
    wait(for: [expectation], timeout: 3.0)
  }

  func testProfileSections() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Verify sections from JSON profile", comment: ""))

    networkManager.requestProfile { (profileServiceResult) in
      switch profileServiceResult {
      case .success(let profile):
        XCTAssertFalse(profile.summary.isEmpty)
        expectation.fulfill()
      case .error:
        XCTFail()
      }
    }
    wait(for: [expectation], timeout: 3.0)
  }
  
  func testProfileConnectionError() {
    let expectation = XCTestExpectation(description: NSLocalizedString("Please check your network connection.", comment: ""))
    networkManager.requestProfile { (profileServiceResult) in
      self.networkManager.router.request(.profile) { (data, response, error) in
        expectation.fulfill()
      }
    }
    wait(for: [expectation], timeout: 3.0)
  }
}
