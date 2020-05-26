import XCTest
@testable import Ledger

final class LedgerTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(Ledger().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
