import Foundation

public struct Order {
  public private(set) var id: String
  public private(set) var size: Int
  public private(set) var price: Double
  public private(set) var updateType: Order.UpdateType
  public private(set) var transactionType: Order.TransactionType
  public private(set) var timestamp: Date

  public var impliedSize: Int {
    updateType == .insert ? size : -(size)
  }

  public enum UpdateType: String {
    case insert, delete
  }

  public enum TransactionType: String {
    case bid, ask
  }

  public init(
    id: String,
    bidSize: Int,
    bidPrice: Double,
    updateType: Order.UpdateType = .insert,
    timestamp: Date = Date()
  ) {
    self.id = id
    self.size = bidSize
    self.price = bidPrice
    self.updateType = updateType
    self.transactionType = .bid
    self.timestamp = timestamp
  }

  public init(
    id: String,
    askSize: Int,
    askPrice: Double,
    updateType: Order.UpdateType = .insert,
    timestamp: Date = Date()
  ) {
    self.id = id
    self.size = askSize
    self.price = askPrice
    self.updateType = updateType
    self.transactionType = .ask
    self.timestamp = timestamp
  }
}
