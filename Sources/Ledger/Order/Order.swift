import Foundation

public struct LimitOrder: Order {
    public var id: String
    public var price: Double
    public var size: Int
    public var transactionType: TransactionType
    public var timestamp: Date
    
    public init(id: String, bidPrice: Double, bidSize: Int, timestamp: Date = Date()) {
        self.id = id
        self.price = bidPrice
        self.size = bidSize
        self.transactionType = TransactionType.bid
        self.timestamp = timestamp
    }
    
    public init(id: String, askPrice: Double, askSize: Int, timestamp: Date = Date()) {
        self.id = id
        self.price = askPrice
        self.size = askSize
        self.transactionType = TransactionType.ask
        self.timestamp = timestamp
    }
}

public struct CancelOrder: Order {
    public var id: String              // Reference to LimitOrder id
    public var price: Double
    public var size: Int
    public var transactionType: TransactionType
    public var timestamp: Date
    
    public init(id: String, bidPrice: Double, bidSize: Int, timestamp: Date = Date()) {
        self.id = id
        self.price = bidPrice
        self.size = bidSize
        self.transactionType = TransactionType.bid
        self.timestamp = timestamp
    }
    
    public init(id: String, askPrice: Double, askSize: Int, timestamp: Date = Date()) {
        self.id = id
        self.price = askPrice
        self.size = askSize
        self.transactionType = TransactionType.ask
        self.timestamp = timestamp
    }
}

public struct ModifyOrder: Order {
    public var id: String              // Reference to LimitOrder id
    public var price: Double
    public var size: Int
    public var transactionType: TransactionType
    public var timestamp: Date
    
    public init(id: String, bidPrice: Double, bidSize: Int, timestamp: Date = Date()) {
        self.id = id
        self.price = bidPrice
        self.size = bidSize
        self.transactionType = TransactionType.bid
        self.timestamp = timestamp
    }
    
    public init(id: String, askPrice: Double, askSize: Int, timestamp: Date = Date()) {
        self.id = id
        self.price = askPrice
        self.size = askSize
        self.transactionType = TransactionType.ask
        self.timestamp = timestamp
    }
}

public protocol Order {
    var id: String { get }
    var price: Double { get }
    var size: Int { get }
    var transactionType: TransactionType { get }
    var timestamp: Date { get }
}

public enum TransactionType: String {
    case bid, ask
}

public enum OrderError: Error {
    case invalidTransactionType
}
