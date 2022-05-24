import XCTest

class ReverseWordsUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testUIViewsExist() {
        XCTAssertTrue(app.staticTexts["titleLabel"].exists)
        XCTAssertTrue(app.staticTexts["descriptionLabel"].exists)
        XCTAssertTrue(app.textFields["reverseTextField"].exists)
        XCTAssertFalse(app.staticTexts["resultLabel"].exists)
        XCTAssertTrue(app.staticTexts["resultTitle"].exists)
        XCTAssertTrue(app.segmentedControls.element.exists)
        XCTAssertTrue(app.staticTexts["allCharactersLabel"].exists)
        XCTAssertFalse(app.textFields["ignoreCharactersTextField"].exists)
    }

    func test_defaultExclusion() {
        enterStringInTextFieldById(phrase: "Batman cool 24/7", id: "reverseTextField")
        let expectedResult = "namtaB looc 24/7"
        // Check result
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)
    }

    func test_customExclusion_letters() {
        enterStringInTextFieldById(phrase: "Batman cool 24/7", id: "reverseTextField")
        let expectedResult = "namtaB oocl 7/42"
        // Select view with TextField
        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()
        enterStringInTextFieldById(phrase: "xl", id: "ignoreCharactersTextField")
//        app.buttons["resultButton"].tap()
        // Check result
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)    }

    func test_customExclusion_digits() {
        enterStringInTextFieldById(phrase: "Batman cool 24/7", id: "reverseTextField")
        let expectedResult = "namtaB looc /427"
        // Select view with TextField
        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()
        enterStringInTextFieldById(phrase: "1370", id: "ignoreCharactersTextField")
        // Check result
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)
    }

    func test_customExclusion_symbols() {
        enterStringInTextFieldById(phrase: "Batman cool 24/7", id: "reverseTextField")
        let expectedResult = "namtaB looc 74/2"
        // Select view with TextField
        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()
        enterStringInTextFieldById(phrase: "/", id: "ignoreCharactersTextField")
        // Check result
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)
    }

    func test_segmentedControlTap_changeViews() {
        XCTAssertTrue(app.staticTexts["allCharactersLabel"].exists)
        XCTAssertFalse(app.textFields["ignoreCharactersTextField"].exists)

        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()

        XCTAssertFalse(app.staticTexts["allCharactersLabel"].exists)
        XCTAssertTrue(app.textFields["ignoreCharactersTextField"].exists)
    }

    func test_defaultExclusion_customExclusion() {
        enterStringInTextFieldById(phrase: "Batman cool 24/7", id: "reverseTextField")
        var expectedResult = "namtaB looc 24/7"

        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)

        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)

        enterStringInTextFieldById(phrase: "Batman", id: "ignoreCharactersTextField")
        expectedResult = "Batman looc 7/42"
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)

        app.segmentedControls.children(matching: .button).element(boundBy: 0).tap()
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        expectedResult = "namtaB looc 24/7"
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)

        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        expectedResult = "Batman looc 7/42"
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)
    }

    // Group repeating parts
    private func enterStringInTextFieldById(phrase: String, id: String) {
        // String input
        let textField = app.textFields[id]
        textField.tap()
        textField.typeText(phrase)

        // Hide keyboard
        app.staticTexts["titleLabel"].tap()
    }

    private func clearTextField(id: String) {
        app.textFields[id].press(forDuration: 1.2)
        app.menuItems["Select All"].tap()
        app.menuItems["Cut"].tap()
    }

}
