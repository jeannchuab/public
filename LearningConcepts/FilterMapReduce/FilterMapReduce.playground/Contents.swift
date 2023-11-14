import UIKit

struct IndieApp {
    let name: String
    let monthlyPrice: Double
    let users: Int
}

let appPortfolio = [IndieApp(name: "Creator View", monthlyPrice: 11.99, users: 4356),
                     IndieApp(name: "FitHero", monthlyPrice: 0.00, users: 100756),
                     IndieApp(name: "Buckets", monthlyPrice: 3.99, users: 7598),
                     IndieApp(name: "Connect Four", monthlyPrice: 1.99, users: 34081),
                     IndieApp(name: "Money", monthlyPrice: 0.99, users: 259800),
                     IndieApp(name: "Mirrors", monthlyPrice: 1.99, users: 0)]

let appPortfolio2 = [IndieApp(name: "Mirrors", monthlyPrice: 1.99, users: 5),
                     IndieApp(name: "Mirrors 2", monthlyPrice: 1.99, users: 12),
                     IndieApp(name: "Mirrors 2", monthlyPrice: 1.99, users: 1)]



// Filter
let freeApps = appPortfolio.filter { $0.monthlyPrice == 0.00 }
//print(freeApps)

let highDemandApps = appPortfolio.filter { $0.users > 10000 }
//print(freeApps)

// Map
let appNames = appPortfolio.map { $0.name }.sorted()
//print(appNames)

let appNamesWithSufix = appPortfolio.map { "\($0.name)\("Sufix")" }.sorted()
//print(appNamesWithSufix)

let increasedPrices = appPortfolio.map { $0.monthlyPrice * 1.5 }
//print(increasedPrices)

// Reduce
let numbers = [1, 2, 3]

// This means that 0 (first parameter) will be added to the sum of all elements in the array numbers
let sum = numbers.reduce(100, +)
//print(sum)

// This means that 100 (first parameter) will be subtracted (Minus signal (-) ) to the sum of all elements in the array numbers
let diff = numbers.reduce(100, -)
//print(diff)

print(appPortfolio.reduce(0, { $0 + $1.users }))
//print(appPortfolio2.reduce(0, { $0 + $1.users }))

// Chaining
// ATTENTION: Be careful with readability
let recurringRevenue = appPortfolio.map { $0.monthlyPrice * Double($0.users) }.reduce(0, +)
//print(recurringRevenue)


// CompactMap: Remove nil value form an array
let nilNumbers = [nil, "foo", "bar"]
let nonNilNumbers = nilNumbers.compactMap { $0 }
print(nonNilNumbers)


// FlatMap: Makes a two dimensions array became one dimension
let arrayOfArrays = [[1,2,3],
                     [4,5,6],
                     [7,8,9]]

let singleArray = arrayOfArrays.flatMap { $0 }
//print(singleArray)





  



