import UIKit

/**
 
 Opaque Return Types is a feature added in Swift 5.1. It comes to fix a fundamental problem of the usage of protocols and the design of Swift APIs. It can be used to return some value for function/method, and property without revealing the concrete type of the value to client that calls the API.
 
 More info: https://dsrijan.medium.com/opaque-type-in-swift-4015aeeca1ac
 
 */

protocol Shape {
    associatedtype T
    func draw() -> T
}

class Circle: Shape {
    typealias T = Int
    var name = "circle"
    
    func draw() -> Int {
        return 1
    }
}

class Triangle: Shape {
    typealias T = Double
    var name = "triangle"
    func draw() -> Double {
        return 1.0
    }
}

func getShapeType () -> some Shape {
    let shape = Circle()
    return shape
}

func getShapeTypeOther() -> some Shape {
    let shape = Triangle()
    return shape
}
