import UIKit

struct NameStruct {
    var firstName: String
    var lastName: String
}

var joe = NameStruct(firstName: "Joe", lastName: "Satriani")
var patrick = joe

print(joe)
print(patrick)

patrick.firstName = "Patrick"
patrick.lastName = "McKenna"

print(joe)
print(patrick)
