import XCTest
@testable import Newt

final class NewtTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Newt().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
