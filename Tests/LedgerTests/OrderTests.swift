import XCTest

@testable import Ledger

class OrderTests: XCTestCase {
  func testLimitOrderInit() {
    let bidOrder = Order(id: "1", bidSize: 25, bidPrice: 100.00)
    XCTAssertEqual(bidOrder.transactionType, .bid)
    XCTAssertEqual(bidOrder.updateType, .insert)

    let askOrder = Order(id: "2", askSize: 15, askPrice: 101.00)
    XCTAssertEqual(askOrder.transactionType, .ask)
    XCTAssertEqual(bidOrder.updateType, .insert)
  }

  func testCancelOrderInit() {
    let cancelBidOrder = Order(id: "1", bidSize: 25, bidPrice: 100.00, updateType: .delete)
    XCTAssertEqual(cancelBidOrder.transactionType, .bid)

    let cancelAskOrder = Order(id: "2", askSize: 15, askPrice: 101.00, updateType: .delete)
    XCTAssertEqual(cancelAskOrder.transactionType, .ask)
  }

  static var allTests = [
    ("testLimitOrderInit", testLimitOrderInit),
    ("testCancelOrderInit", testCancelOrderInit),
  ]
}
