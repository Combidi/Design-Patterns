import Foundation

struct Product: Hashable {
    let name: String
    let price: Decimal
}

protocol PaymentStrategy {
    func pay(amount: Decimal)
}

struct PayPal: PaymentStrategy {
    
    let email: String
    let password: String
    
    func pay(amount: Decimal) {
        print("Paid €\(amount) with Pay Pal")
    }
}

struct Creditcard: PaymentStrategy {
    
    let name: String
    let number: String
    let expDate: Date
    
    func pay(amount: Decimal) {
        print("Paid €\(amount) with Creditcard")
    }
}

class ShoppingCart {
        
    typealias Count = Int
    
    private var items: [Product: Count] = [:]
    
    func add(item: Product) {
        if let currentCount = items[item] {
            items[item] = currentCount + 1
        } else {
            items[item] = 1
        }
    }
    
    func remove(item: Product) {
        items[item] = nil
    }
    
    private var totalPrice: Decimal {
        items.enumerated().reduce(Decimal(), { $0 + ($1.element.key.price * Decimal($1.element.value)) })
    }
        
    func pay(with strategy: PaymentStrategy) {
        strategy.pay(amount: totalPrice)
    }
}

// Create the shopping cart
let shoppingCart = ShoppingCart()

// Add items to the shopping cart
shoppingCart.add(item: .init(name: "Shirt", price: 24.95))
shoppingCart.add(item: .init(name: "Shirt", price: 24.95))

shoppingCart.add(item: .init(name: "Shoes", price: 89.95))

shoppingCart.add(item: .init(name: "Pants", price: 49.95))
shoppingCart.add(item: .init(name: "Pants", price: 49.95))

shoppingCart.add(item: .init(name: "Socks", price: 4.95))

// Make payment
shoppingCart.pay(with: PayPal(
    email: "example.gmail.com",
    password: "password"
))

// Add another product to the shopping cart
shoppingCart.add(item: .init(name: "Socks", price: 4.95))

shoppingCart.pay(with: Creditcard(
    name: "Peter",
    number: "001",
    expDate: .init()
))
