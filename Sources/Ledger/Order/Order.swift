public struct Order {
    public var id: String
    public var price: Double
    public var size: Int
    public var transactionType: TransactionType
    
    public enum TransactionType: String {
        case bid, ask
    }
    
    init(id: String, bid_price: Double, bid_size: Int) {
        self.id = id
        self.price = bid_price
        self.size = bid_size
        self.transactionType = TransactionType.bid
    }
    
    init(id: String, ask_price: Double, ask_size: Int) {
        self.id = id
        self.price = ask_price
        self.size = ask_size
        self.transactionType = TransactionType.ask
    }
}
