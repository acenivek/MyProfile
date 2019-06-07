import XCTest

// MARK: - ProfileUITests class
class ProfileUITests: XCTestCase {
  // MARK: - Attributes
  let app = XCUIApplication()

  // MARK: - Super class methods
  override func setUp() {
    continueAfterFailure = false
    app.launch()
  }

  // MARK: - Tests methods
  func testAboutMeSection() {
    XCTAssertTrue(app.tabBars.buttons["ABOUT ME"].exists)
  }

  func testKnowledgeSection() {
    XCTAssertTrue(app.tabBars.buttons["KNOWLEDGE"].exists)
  }

  func testExperienceSection() {
    XCTAssertTrue(app.tabBars.buttons["EXPERIENCE"].exists)
  }
}
