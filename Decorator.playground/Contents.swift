import UIKit

enum Prices: Int{
    case SimpleCoffe = 50
    case Milk = 40
    case Sugar = 10
    case WhipСream = 60
}

protocol Coffee {
    var cost: Int { get }
}

class SimpleCoffee: Coffee {
    var cost: Int {
        return Prices.SimpleCoffe.rawValue
    }
}

protocol CoffeeDecorator: Coffee{
    var base: Coffee { get }
    init(base: Coffee)
}

class Milk: CoffeeDecorator{
    var cost: Int{
        return base.cost + Prices.Milk.rawValue
    }
    var base: Coffee
    
    required init(base: Coffee){
        self.base = base
    }
}

class Sugar: CoffeeDecorator{
    var cost: Int{
        return base.cost + Prices.Sugar.rawValue
    }
    var base: Coffee
    
    required init(base: Coffee){
        self.base = base
    }
}

class WhipСream: CoffeeDecorator{
    var cost: Int{
        return base.cost + Prices.WhipСream.rawValue
    }
    var base: Coffee
    
    required init(base: Coffee){
        self.base = base
    }
}


let coffee = SimpleCoffee()
let coffeWithMilkAndShugar = Sugar(base: Milk(base: coffee))
print("Coffe With Milk And Shugar cost: \(coffeWithMilkAndShugar.cost)")

let coffeWithDubleShugarAndWhipСream = Sugar(base: Sugar(base: WhipСream(base: coffee)))
print("Coffe With Duble Shugar And Whip Сream cost: \(coffeWithDubleShugarAndWhipСream.cost)")
