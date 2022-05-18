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
        XCTAssertTrue(app.otherElements["lineView"].exists)
        XCTAssertFalse(app.staticTexts["resultLabel"].exists)
        XCTAssertTrue(app.buttons["reverseButton"].exists)
    }

    func testCorrectReversePhrase() {
        enterStringAndReverse()

        let expectedResult = "tseT gnirts"

        XCTAssertTrue(app.staticTexts["resultLabel"].exists)
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "resultLabel").label, expectedResult)
    }

    func testCorrectChangeButtonTitle() {
        enterStringAndReverse()

        XCTAssertEqual(app.buttons["reverseButton"].label, "Clear")

        app.buttons["reverseButton"].tap()
        XCTAssertEqual(app.buttons["reverseButton"].label, "Reverse")
    }

    func testCorrectPlaceHolderAfterClearButtonClick() {
        enterStringAndReverse()

        app.buttons["reverseButton"].tap()
        let placeholder = app.textFields["reverseTextField"].value as? String
        XCTAssertEqual(placeholder, "Text to reverse")
        XCTAssertFalse(app.staticTexts["resultLabel"].exists)
    }

    private func enterStringAndReverse() {
        let textField = app.textFields["reverseTextField"]
        textField.tap()
        textField.typeText("Test string")
        app.keyboards.buttons["Return"].tap()
        app.buttons["reverseButton"].tap()
    }

}
