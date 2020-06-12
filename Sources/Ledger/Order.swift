import Foundation

struct Order {
  var id: String
  var size: Int
  var price: Double
  var updateType: Order.UpdateType
  var transactionType: Order.TransactionType
  var timestamp: Date

  var impliedSize: Int {
    updateType == .insert ? size : -(size)
  }

  public enum UpdateType: String {
    case insert, delete
  }

  public enum TransactionType: String {
    case bid, ask
  }

  init(
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

  init(
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
