//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String {get}
    func price() -> Int
}

class Item : SKU {
    let name: String
    let priceEach: Int
    init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach = priceEach
    }
    func price() -> Int {
        return priceEach
    }
}

class Receipt {
    
    private var itemsIn: [SKU] = []
    
    func add(item: SKU) {
        itemsIn.append(item)
    }
    
    func items() -> [SKU] {
        return itemsIn
    }
    
    func total() -> Double {
        return Double(itemsIn.reduce(0) {$0 + $1.price()})
    }
    
    func output() -> String {
        
        var output = "Receipt:\n"
        itemsIn.forEach { output += "\($0.name): $\(String(format: "%.2f", Double($0.price())/100))\n" }
        output += "------------------\n"
        output += "TOTAL: $\(String(format: "%.2f", total()/100))"
        return output
    }
}

class Register {
    
    private var currentReceipt = Receipt()
    
    func scan(_ itemScan: SKU) {
        currentReceipt.add(item: itemScan)
    }
    
    func subtotal() -> Double {
        return currentReceipt.total()
    }
    
    func total() -> Receipt {
        let finalReceipt = currentReceipt
        currentReceipt = Receipt()
        return finalReceipt
    }
    
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

