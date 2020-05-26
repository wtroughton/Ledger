public struct Ledger: LedgerProtocol {
    var bidOrders: [Order] = []
    var askOrders: [Order] = []
    
    public init() {}
    
    public var bidPrices: Dictionary<Double, Int> {
        var dict: Dictionary<Double, Int> = [:]
        for order in bidOrders {
            if dict[order.price] != nil {
                dict[order.price]! += order.size
            } else {
                dict[order.price] = order.size
            }
        }
        return dict
    }
    
    public var askPrices: Dictionary<Double, Int> {
        var dict: Dictionary<Double, Int> = [:]
        for order in askOrders {
            if dict[order.price] != nil {
                dict[order.price]! += order.size
            } else {
                dict[order.price] = order.size
            }
        }
        return dict
    }
    
    public mutating func addOrder(order: Order) {
        if order.transactionType == Order.TransactionType.bid {
            bidOrders.append(order)
        } else {
            askOrders.append(order)
        }
    }
}

protocol LedgerProtocol {
    var bidPrices: Dictionary<Double, Int> { get }
    var askPrices: Dictionary<Double, Int> { get }
}
