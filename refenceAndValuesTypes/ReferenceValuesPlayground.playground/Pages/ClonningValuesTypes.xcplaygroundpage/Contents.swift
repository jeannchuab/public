import UIKit

struct NameStruct {
    var firstName: String
    var lastName: String
}

class Name {
    var firstName: String
    var lastName: String
    var degree: String
    
    //consctructor
    init(firstName: String, lastName: String, degree: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.degree = degree
    }
    
    func clone() -> Name {
        let name = Name(firstName: self.firstName, lastName: self.lastName, degree: self.degree)
        return name
    }
//    convenience init(firstName: String) {
//        self.firstName = firstName
//        lastName = ""
//        degree = ""
        
//        self.init(firstName: firstName, lastName: lastName, degree: degree)
//    }
}

class NameWar: Name {
    var warname: String
    
    init(warname: String) {
        self.warname = warname
        super.init(firstName: "", lastName: "", degree: "")
    }
}

var puta: NameWar = NameWar(warname: "Samanta")
//puta.

var lanesName: Name = Name(firstName: "Kell", lastName: "Lanes", degree: "Bachelor's")
print(lanesName)

var claraName = lanesName
//claraName.firstName = "Clara"
print(claraName.firstName)
print(lanesName.firstName)



//struct
var jeannName: NameStruct = NameStruct(firstName: "Jeann", lastName: "Chuab")

var joseName = jeannName
var roseName = jeannName

print(joseName.firstName)
print(roseName.firstName)

joseName.firstName = "Jose"
roseName.firstName = "Rose"

print(jeannName.firstName)
print(joseName.firstName)
print(roseName.firstName)







//lanesName.firstName = "Kell"
//lanesName.lastName = "Lanes"



//
//var joe = NameStruct(firstName: "Joe", lastName: "Satriani")
//var patrick = joe
//
//print(joe)
//print(patrick)
//
//patrick.firstName = "Patrick"
//patrick.lastName = "McKenna"
//
//print(joe)
//print(patrick)
