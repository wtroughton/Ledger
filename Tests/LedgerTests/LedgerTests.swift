import XCTest

@testable import Ledger

class LedgerTests: XCTestCase {
  func testAddOrder() {
    //        var ledger = SimpleLedger()
    //        let bidOrder = LimitOrder(id: "1", bidPrice: 100.00, bidSize: 25)
    //        let bidOrder2 = LimitOrder(id: "2", bidPrice: 101.00, bidSize: 20)
    //        let bidOrder3 = LimitOrder(id: "3", bidPrice: 102.00, bidSize: 15)
    //
    //        ledger.insertBidOrder(bidOrder)
    //        ledger.insertBidOrder(bidOrder2)
    //        ledger.insertBidOrder(bidOrder3)
    //
    //        let bidPriceLevel = ledger.calculateBidPriceLevels()
    //        XCTAssertEqual(bidPriceLevel[100.00], 25)
    //        XCTAssertEqual(bidPriceLevel[101.00], 20)
    //        XCTAssertEqual(bidPriceLevel[102.00], 15)
  }
  //
  //    func testAddOrderWithSamePrice() {
  //        var ledger = SimpleLedger()
  //        let bidOrder = LimitOrder(id: "1", bidPrice: 100.00, bidSize: 25)
  //        let bidOrder2 = LimitOrder(id: "2", bidPrice: 100.00, bidSize: 20)
  //
  //        ledger.insertBidOrder(bidOrder)
  //        ledger.insertBidOrder(bidOrder2)
  //
  //        let bidPriceLevel = ledger.calculateBidPriceLevels()
  //        XCTAssertEqual(bidPriceLevel[100.00], 45)
  //    }
  //
  //    func testCancelOrder() {
  //        var ledger = SimpleLedger()
  //        let bidOrder = LimitOrder(id: "1", bidPrice: 100.00, bidSize: 25)
  //        let cancelBidOrder = CancelOrder(id: "1", bidPrice: 100.00, bidSize: 25)
  //
  //        ledger.insertBidOrder(bidOrder)
  //        ledger.cancelBidOrder(cancelBidOrder)
  //
  //        let bidPriceLevel = ledger.calculateBidPriceLevels()
  //        XCTAssertEqual(bidPriceLevel[100.00], 0)
  //    }
  //
  //    func testModifyOrder() {
  //        var ledger = SimpleLedger()
  //        let bidOrder = LimitOrder(id: "1", bidPrice: 100.00, bidSize: 25)
  //        let cancelOrder = CancelOrder(id: "1", bidPrice: 100.00, bidSize: 20)
  //        let modifyOrder = ModifyOrder(id: "1", bidPrice: 100.00, bidSize: 7)
  //
  //        ledger.insertBidOrder(bidOrder)
  //        ledger.cancelBidOrder(cancelOrder)
  //        ledger.modifyBidOrder(modifyOrder)
  //
  //        let bidPriceLevel = ledger.calculateBidPriceLevels()
  //        XCTAssertEqual(bidPriceLevel[100.00], 7)
  //    }
  //
  //    func testModifyOrderWithMultiLimitOrders() {
  //        var ledger = SimpleLedger()
  //        let bidOrder = LimitOrder(id: "1", bidPrice: 100.00, bidSize: 25)
  //        let bidOrder2 = LimitOrder(id: "1", bidPrice: 100.00, bidSize: 25)
  //        let bidOrder3 = LimitOrder(id: "1", bidPrice: 100.00, bidSize: 25)
  //
  //        let cancelOrder = CancelOrder(id: "1", bidPrice: 100.00, bidSize: 20)
  //        let modifyOrder = ModifyOrder(id: "1", bidPrice: 100.00, bidSize: 7)
  //
  //        ledger.insertBidOrder(bidOrder)
  //        ledger.insertBidOrder(bidOrder2)
  //        ledger.insertBidOrder(bidOrder3)
  //        ledger.cancelBidOrder(cancelOrder)
  //        ledger.modifyBidOrder(modifyOrder)
  //
  //        let bidPriceLevel = ledger.calculateBidPriceLevels()
  //        XCTAssertEqual(bidPriceLevel[100.00], 7)
  //    }
  //
  //    func testMultiModifyOrders() {
  //        var ledger = SimpleLedger()
  //        let bidOrder = LimitOrder(id: "1", bidPrice: 100.00, bidSize: 25)
  //        let modifyOrder = ModifyOrder(id: "1", bidPrice: 100.00, bidSize: 7)
  //        let modifyOrder2 = ModifyOrder(id: "1", bidPrice: 102.00, bidSize: 40)
  //
  //        ledger.insertBidOrder(bidOrder)
  //        ledger.modifyBidOrder(modifyOrder)
  //        ledger.modifyBidOrder(modifyOrder2)
  //        let bidPriceLevel = ledger.calculateBidPriceLevels()
  //        XCTAssertEqual(bidPriceLevel[100.00], 0)
  //        XCTAssertEqual(bidPriceLevel[102.00], 40)
  //    }

  static var allTests = [
    ("testAddOrder", testAddOrder)
    //        ("testAddOrderWithSamePrice", testAddOrderWithSamePrice),
    //        ("testCancelOrder", testCancelOrder),
    //        ("testModifyOrder", testModifyOrder),
    //        ("testModifyOrderWithMultiLimitOrders", testModifyOrderWithMultiLimitOrders),
    //        ("testMultiModifyOrders", testMultiModifyOrders)
  ]
}
