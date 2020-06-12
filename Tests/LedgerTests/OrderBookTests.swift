import XCTest

@testable import Ledger

class OrderBookTests: XCTestCase {
  func testOrderBookInit() {
    let orderBook = OrderBook()
    XCTAssertNotNil(orderBook.bids)
    XCTAssertNotNil(orderBook.bids)
  }

  func testOrderBookAppendOrders() {
    var orderBook = OrderBook()
    let order1 = Order(id: "1", bidSize: 25, bidPrice: 100.00)
    let order2 = Order(id: "2", bidSize: 5, bidPrice: 100.00)
    let order3 = Order(id: "3", askSize: 15, askPrice: 101.00)

    orderBook.appendOrder(bidOrder: order1)
    orderBook.appendOrder(bidOrder: order2)
    orderBook.appendOrder(askOrder: order3)

    XCTAssertEqual(orderBook.bids[100], 30)
    XCTAssertEqual(orderBook.asks[101], 15)
  }

  func testOrderBookUpdatePriceLevel() {
    var orderBook = OrderBook()
    orderBook.updatePriceLevel(bidPrice: 100, bidSize: 25)
    orderBook.updatePriceLevel(bidPrice: 100, bidSize: 50)

    XCTAssertEqual(orderBook.bids[100], 50)
  }
}
