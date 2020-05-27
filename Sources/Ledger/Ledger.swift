protocol Ledger {
    func calculateBidPriceLevels() -> Dictionary<Double, Int>
    func calculateAskPriceLevels() -> Dictionary<Double, Int>
    
    mutating func insertBidOrder(_ order: LimitOrder)
    mutating func insertAskOrder(_ order: LimitOrder)
    mutating func cancelBidOrder(_ order: CancelOrder)
    mutating func cancelAskOrder(_ order: CancelOrder)
    mutating func modifyBidOrder(_ order: ModifyOrder)
    mutating func modifyAskOrder(_ order: ModifyOrder)
}

public struct SimpleLedger: Ledger {
    var bidOrders: [Order] = []
    var askOrders: [Order] = []
    
    public init() {}
    
    /**
     Inserts a LimitOrder on bid side.
     - Parameter order: The LimitOrder being inserted
     */
    public mutating func insertBidOrder(_ order: LimitOrder) {
        guard order.transactionType == TransactionType.bid else {
            return
        }
        bidOrders.append(order)
    }

    /**
     Inserts a LimitOrder on ask side.
     - Parameter order: The LimitOrder being inserted
     */
    public mutating func insertAskOrder(_ order: LimitOrder) {
        guard order.transactionType == TransactionType.ask else {
            return
        }
        askOrders.append(order)
    }
    
    /**
     Creates a CancelOrder on bid side.  This operation is state dependent on LimitOrder.
     - Parameter order: The CancelOrder being inserted.
     */
    public mutating func cancelBidOrder(_ order: CancelOrder) {
        guard order.transactionType == TransactionType.bid else {
            return
        }
        
        if bidOrders.contains(where: {$0.id == order.id}) {
            bidOrders.append(order)
        }
    }
    
    /**
     Creates a CancelOrder on ask side. This operation is state dependent on LimitOrder.
     - Parameter order: The CancelOrder being inserted.
     */
    public mutating func cancelAskOrder(_ order: CancelOrder) {
        guard order.transactionType == TransactionType.ask else {
            return
        }
        
        if askOrders.contains(where: {$0.id == order.id}) {
            askOrders.append(order)
        }
    }
    
    /**
     Creates a ModifyOrder on bid side. Modifies the current order by canceling an order and placing
     new limit order.
     - Parameter modifyOrder: The ModifyOrder being created.
     */
    public mutating func modifyBidOrder(_ modifyOrder: ModifyOrder) {
        let bidOrdersWithId = bidOrders.filter({$0.id == modifyOrder.id})
        
        if bidOrdersWithId.count > 0 {
            var currentPrice = bidOrdersWithId[0].price
            var currentSize  = bidOrdersWithId[0].size
            
            for i in 1..<bidOrdersWithId.count {
                let order = bidOrdersWithId[i]
                
                if order is LimitOrder {
                    if (currentPrice != order.price) {
                        currentPrice = order.price
                        currentSize = order.size
                    }
                    else {
                        currentSize += order.size
                    }
                } else if order is CancelOrder{
                    assert(currentPrice == order.price) // invariant
                    currentSize -= order.size
                } else {
                    // TODO: Add logging or throw exception
                    return
                }
            }
            
            cancelBidOrder(CancelOrder(id: modifyOrder.id, bidPrice: currentPrice, bidSize: currentSize, timestamp: modifyOrder.timestamp))
            insertBidOrder(LimitOrder(id: modifyOrder.id, bidPrice: modifyOrder.price, bidSize: modifyOrder.size, timestamp: modifyOrder.timestamp))
        }
    }
    
    /**
     Creates a ModifyOrder on ask side. Modifies the current order by canceling an order and placing
     new limit order.
     - Parameter modifyOrder: The ModifyOrder being created.
     */
    public mutating func modifyAskOrder(_ modifyOrder: ModifyOrder) {
        let askOrdersWithId = askOrders.filter({$0.id == modifyOrder.id})
        
        if askOrdersWithId.count > 0 {
            var currentPrice = askOrdersWithId[0].price
            var currentSize  = askOrdersWithId[0].size
            
            for i in 1..<askOrdersWithId.count {
                let order = askOrdersWithId[i]
                
                if order is LimitOrder {
                    if (currentPrice != order.price) {
                        currentPrice = order.price
                        currentSize = order.size
                    }
                    else {
                        currentSize += order.size
                    }
                } else if order is CancelOrder{
                    assert(currentPrice == order.price) // invariant
                    currentSize -= order.size
                } else {
                    // TODO: Add logging or throw exception
                    return
                }
            }
            
            cancelAskOrder(CancelOrder(id: modifyOrder.id, askPrice: currentPrice, askSize: currentSize, timestamp: modifyOrder.timestamp))
            insertAskOrder(LimitOrder(id: modifyOrder.id, askPrice: modifyOrder.price, askSize: modifyOrder.size, timestamp: modifyOrder.timestamp))
        }
    }
    
    /**
     Calculate price levels on the bid side by summation of limit orders and cancel orders.
     - Returns: Dictionary where key is price and value is the lot size.
     */
    public func calculateBidPriceLevels() -> Dictionary<Double, Int> {
        var dict: Dictionary<Double, Int> = [:]
        
        for order in bidOrders {
            if order is LimitOrder {
                if dict[order.price] != nil {
                    dict[order.price]! += order.size
                } else {
                    dict[order.price] = order.size
                }
            } else if order is CancelOrder{
                dict[order.price]! -= order.size
            }
        }
        return dict
    }
    
    /**
     Calculate price levels on the ask side by summation of limit orders and cancel orders.
     - Returns: Dictionary where key is price and value is the lot size.
     */
    public func calculateAskPriceLevels() -> Dictionary<Double, Int> {
        var dict: Dictionary<Double, Int> = [:]
        
        for order in askOrders {
            if order is LimitOrder {
                if dict[order.price] != nil {
                    dict[order.price]! += order.size
                } else {
                    dict[order.price] = order.size
                }
            } else if order is CancelOrder{
                dict[order.price]! -= order.size
            }
        }
        return dict
    }
}
