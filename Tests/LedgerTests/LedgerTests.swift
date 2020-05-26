import XCTest
@testable import Ledger

class LedgerTests: XCTestCase {
    func testAddOrders() {
        var ledger = Ledger()
        let bidOrder = Order(id: "1", bid_price: 100.00, bid_size: 25)
        let bidOrder2 = Order(id: "2", bid_price: 101.00, bid_size: 20)
        let bidOrder3 = Order(id: "3", bid_price: 102.00, bid_size: 15)
        
        ledger.addOrder(order: bidOrder)
        ledger.addOrder(order: bidOrder2)
        ledger.addOrder(order: bidOrder3)
        
        let bidPrices = ledger.bidPrices
        XCTAssertEqual(bidPrices[100.00], 25)
        XCTAssertEqual(bidPrices[101.00], 20)
        XCTAssertEqual(bidPrices[102.00], 15)
    }
    
    func testAddOrdersWithSamePrice() {
        var ledger = Ledger()
        let bidOrder = Order(id: "1", bid_price: 100.00, bid_size: 25)
        let bidOrder2 = Order(id: "2", bid_price: 100.00, bid_size: 20)
        
        ledger.addOrder(order: bidOrder)
        ledger.addOrder(order: bidOrder2)
        
        let bidPrices = ledger.bidPrices
        XCTAssertEqual(bidPrices[100.00], 45)
    }

    static var allTests = [
        ("testAddOrders", testAddOrders),
        ("testAddOrdersWithSamePrice", testAddOrdersWithSamePrice),
    ]
}
