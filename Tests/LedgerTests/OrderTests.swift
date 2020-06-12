import XCTest

@testable import Ledger

class OrderTests: XCTestCase {
  func testLimitOrderInit() {
    let bidOrder = Order(id: "1", bidSize: 25, bidPrice: 100.00)
    XCTAssertNotNil(bidOrder)

    let askOrder = Order(id: "2", askSize: 15, askPrice: 101.00)
    XCTAssertNotNil(askOrder)
  }

  func testCancelOrderInit() {
    let cancelBidOrder = Order(id: "1", bidSize: 25, bidPrice: 100.00, updateType: .delete)
    XCTAssertNotNil(cancelBidOrder)

    let cancelAskOrder = Order(id: "2", askSize: 15, askPrice: 101.00, updateType: .delete)
    XCTAssertNotNil(cancelAskOrder)
  }

  static var allTests = [
    ("testLimitOrderInit", testLimitOrderInit),
    ("testCancelOrderInit", testCancelOrderInit),
  ]
}
