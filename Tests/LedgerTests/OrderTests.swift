import XCTest
@testable import Ledger

class OrderTests: XCTestCase {
    func testInitialization() {
        let bidOrder = Order(id: "1", bid_price: 100.00, bid_size: 25)
        XCTAssertNotNil(bidOrder)
        
        let askOrder = Order(id: "2", ask_price: 101.00, ask_size: 15)
        XCTAssertNotNil(askOrder)
    }
    
    static var allTests = [
        ("testInitialization", testInitialization),
    ]
}
