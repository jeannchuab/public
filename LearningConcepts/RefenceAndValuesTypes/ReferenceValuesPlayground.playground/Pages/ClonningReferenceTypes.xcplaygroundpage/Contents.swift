import Foundation

class NameClass: NSCopying {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return NameClass(firstName: firstName, lastName: lastName)
    }
    
    func clone() -> NameClass {
        return self.copy() as! NameClass
    }
}

extension NameClass: CustomStringConvertible {
    public var description: String {
        return "NameClass(firstName: \"\(firstName))\", lastName: \"\(lastName)\")"
    }
}

var steve = NameClass(firstName: "Steve", lastName: "Johnson")
var john = steve.clone()

//print(steve)
//print(john)

john.firstName = "John"
john.lastName = "Costa"

print(steve)
print(john)


