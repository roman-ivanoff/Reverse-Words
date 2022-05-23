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
        XCTAssertTrue(app.buttons["resultButton"].exists)
        XCTAssertTrue(app.segmentedControls.element.exists)
        XCTAssertTrue(app.staticTexts["allCharactersLabel"].exists)
        XCTAssertFalse(app.textFields["ignoreCharactersTextField"].exists)
    }

    func test_defaultExclusion() {
        enterStringInTextFieldById(phrase: "Batman cool 24/7", id: "reverseTextField")
        var expectedResult = "namtaB looc 24/7"
        app.buttons["resultButton"].tap()
        // Check result
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)

        // Clear input
        clearTextField(id: "reverseTextField")
        enterStringInTextFieldById(phrase: "abcd efgh", id: "reverseTextField")
        expectedResult = "dcba hgfe"
        app.buttons["resultButton"].tap()
        // Check result
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)

        // Clear input
        clearTextField(id: "reverseTextField")
        enterStringInTextFieldById(phrase: "a1bcd efg!h", id: "reverseTextField")
        expectedResult = "d1cba hgf!e"
        app.buttons["resultButton"].tap()
        // Check result
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)
    }

    func test_customExclusion_letters() {
        enterStringInTextFieldById(phrase: "Batman cool 24/7", id: "reverseTextField")
        var expectedResult = "namtaB oocl 7/42"
        // Select view with TextField
        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()
        enterStringInTextFieldById(phrase: "xl", id: "ignoreCharactersTextField")
        app.buttons["resultButton"].tap()
        // Check result
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)

        // Clear input
        clearTextField(id: "reverseTextField")
        enterStringInTextFieldById(phrase: "abcd efgh", id: "reverseTextField")
        expectedResult = "dcba hgfe"
        app.buttons["resultButton"].tap()
        // Check result
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)

        // Clear input
        clearTextField(id: "reverseTextField")
        enterStringInTextFieldById(phrase: "a1bcd efglh", id: "reverseTextField")
        expectedResult = "dcb1a hgfle"
        app.buttons["resultButton"].tap()
        // Check result
        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        XCTAssertEqual(expectedResult, app.staticTexts.element(matching: .any, identifier: "resultLabel").label)
    }

    func test_customExclusion_digits() {
        enterStringInTextFieldById(phrase: "Batman cool 24/7", id: "reverseTextField")
        let expectedResult = "namtaB looc /427"
        // Select view with TextField
        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()
        enterStringInTextFieldById(phrase: "1370", id: "ignoreCharactersTextField")
        app.buttons["resultButton"].tap()
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
        app.buttons["resultButton"].tap()
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

    func test_segmentedControlTap_hideResultLabel() {
        enterStringInTextFieldById(phrase: "abcd", id: "reverseTextField")
        app.buttons["resultButton"].tap()

        XCTAssertTrue(app.staticTexts["resultLabel"].exists)

        app.segmentedControls.children(matching: .button).element(boundBy: 1).tap()

        XCTAssertFalse(app.staticTexts["resultLabel"].exists)

        enterStringInTextFieldById(phrase: "r", id: "ignoreCharactersTextField")
        app.buttons["resultButton"].tap()

        XCTAssertTrue(app.staticTexts["resultLabel"].exists)

        app.segmentedControls.children(matching: .button).element(boundBy: 0).tap()

        XCTAssertFalse(app.staticTexts["resultLabel"].exists)
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
