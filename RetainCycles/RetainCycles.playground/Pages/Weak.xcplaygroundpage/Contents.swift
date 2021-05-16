import UIKit
import Foundation

class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) { self.name = name }
    
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    weak var tenant: Person?
    
    init(unit: String, tenant: Person) {
        self.unit = unit
        self.tenant = tenant
    }
    
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Costa")
unit4A = Apartment(unit: "4A", tenant: john!)

john!.apartment = unit4A
//unit4A!.tenant = john

john = nil
//unit4A?.tenant

