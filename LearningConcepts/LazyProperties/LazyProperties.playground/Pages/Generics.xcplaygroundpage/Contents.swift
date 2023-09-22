import UIKit

/*
 A lazy var is a property whose initial value is not calculated until the first time it's called.
 It's part of a family of properties in which we have constant properties, computed properties,
 and mutable properties.
 
 More info:
 https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/
*/

struct Calculator {
    static func calculateGamesPlayed() -> Int {
        var games: [Int] = []
        for i in 1...2_000 { games.append(i) }
        return games.last ?? 0 //Not very eficient but that's the point for this demostration
    }
}

struct Player {
    var name: String
    var team: String
    var position: String
    lazy var gamesPlayed = Calculator.calculateGamesPlayed()
    
    // That's not possible, a compile error is generated,
    // cause we are using properties before been initializated
//    var introduction = {
//        return "Now entering the game: \(name), \(position) for the \(team)"
//    }()
    
    // We can use the lazy keyword, so the property will be instatiated in the moment that will be used
    lazy var introduction = {
        return "Now entering the game: \(name), \(position) for the \(team)"
    }()
    
    // We could also use a computed property, but the computed property is recomputed everytime is used
    var gamesPlayedComputed: Int {
        return Calculator.calculateGamesPlayed()
    }
}


var jordan = Player(name: "Michal Jordan", team: "Bulls", position: "Shooting Guard")
// Calculates the lazy property only the first time is used
print(jordan.gamesPlayed)
print(jordan.gamesPlayed)
print(jordan.gamesPlayed)

// Calculates the computed property only the first time is used.
// It's better used when we knot that the property value will be changed at some point
print(jordan.gamesPlayedComputed)
print(jordan.gamesPlayedComputed)
print(jordan.gamesPlayedComputed)

/* ATTENTION: From the Apple Docs: If a property marked with the lazy modifier is accessed by multiple threads simultaneously and the property hasn’t yet been initialized, there’s no guarantee that the property will be initialized only once.

    Conclusion: We don't want to use lazy everywhere.
 
**/
