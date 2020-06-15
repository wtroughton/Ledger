public struct OrderBook {
  public var bids: Map<Double, Int>
  public var asks: Map<Double, Int>
  
  public init() {
    self.bids = [:]
    self.asks = [:]
  }

  public mutating func appendOrder(bidOrder: Order) {
    bids.updateOrAddValue(bidOrder.impliedSize, forKey: bidOrder.price)
  }

  public mutating func appendOrder(askOrder: Order) {
    asks.updateOrAddValue(askOrder.impliedSize, forKey: askOrder.price)
  }

  public mutating func updatePriceLevel(bidPrice price: Double, bidSize size: Int) {
    bids.updateValue(size, forKey: price)
  }

  public mutating func updatePriceLevel(askPrice price: Double, askSize size: Int) {
    asks.updateValue(size, forKey: price)
  }
}
