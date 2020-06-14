public struct OrderBook {
  var bids: Map<Double, Int> = [:]
  var asks: Map<Double, Int> = [:]

  mutating func appendOrder(bidOrder: Order) {
    bids.updateOrAddValue(bidOrder.impliedSize, forKey: bidOrder.price)
  }

  mutating func appendOrder(askOrder: Order) {
    asks.updateOrAddValue(askOrder.impliedSize, forKey: askOrder.price)
  }

  mutating func updatePriceLevel(bidPrice price: Double, bidSize size: Int) {
    bids.updateValue(size, forKey: price)
  }

  mutating func updatePriceLevel(askPrice price: Double, askSize size: Int) {
    asks.updateValue(size, forKey: price)
  }
}
