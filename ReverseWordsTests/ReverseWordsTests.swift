import XCTest
@testable import ReverseWords

class ReverseWordsTests: XCTestCase {

    func testCorrectReversePhrase() {
        let phrase = "Test string"
        let expectedResult = "tseT gnirts"

        let result = ReversePhrase.reverse(phrase: phrase)

        XCTAssertEqual(result, expectedResult)
    }

    func testCorrectWithEmptyInput() {
        let phrase = ""
        let expectedResult = ""

        let result = ReversePhrase.reverse(phrase: phrase)

        XCTAssertEqual(result, expectedResult)
    }

    func testCorrectWithSpacesInput() {
        let phrase = "  "
        let expectedResult = ""

        let result = ReversePhrase.reverse(phrase: phrase)

        XCTAssertEqual(result, expectedResult)
    }

    func testCorrectWithSingleWord() {
        let phrase = "Charizard"
        let expectedResult = "drazirahC"

        let result = ReversePhrase.reverse(phrase: phrase)

        XCTAssertEqual(result, expectedResult)
    }

    func testCorrectWithEmoji() {
        let phrase = "🦊🦉🐥"
        let expectedResult = "🐥🦉🦊"

        let result = ReversePhrase.reverse(phrase: phrase)

        XCTAssertEqual(result, expectedResult)
    }
}
