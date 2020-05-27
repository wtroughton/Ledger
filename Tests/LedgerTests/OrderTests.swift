import XCTest
@testable import Ledger

class OrderTests: XCTestCase {
    func testLimitOrderInit() {
        let bidOrder = LimitOrder(id: "1", bidPrice: 100.00, bidSize: 25)
        XCTAssertNotNil(bidOrder)
        
        let askOrder = LimitOrder(id: "2", askPrice: 101.00, askSize: 15)
        XCTAssertNotNil(askOrder)
    }
    
    func testCancelOrderInit() {
        let cancelBidOrder = LimitOrder(id: "1", bidPrice: 100.00, bidSize: 25)
        XCTAssertNotNil(cancelBidOrder)
        
        let cancelAskOrder = LimitOrder(id: "2", askPrice: 101.00, askSize: 15)
        XCTAssertNotNil(cancelAskOrder)
    }
    
    func testModifyOrderInit() {
        let modifyBidOrder = LimitOrder(id: "1", bidPrice: 100.00, bidSize: 25)
        XCTAssertNotNil(modifyBidOrder)
        
        let modifyAskOrder = LimitOrder(id: "2", askPrice: 101.00, askSize: 15)
        XCTAssertNotNil(modifyAskOrder)
    }
    
    
    static var allTests = [
        ("testLimitOrderInit", testLimitOrderInit),
        ("testCancelOrderInit", testCancelOrderInit),
        ("testModifyOrderInit", testModifyOrderInit),
    ]
}
