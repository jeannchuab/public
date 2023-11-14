import UIKit

var swiftUIDevs: Set = ["Chuab", "Sean", "James"]
var swiftDevs: Set = ["Chuab", "Sean", "James", "Olivia", "Maya", "Leo", "Kell"]
var kotlinDevs: Set = ["Chuab", "James", "Olivia", "Maya", "Leo", "Dan"]
var experiencedDevs: Set = ["Chuab", "Sean", "James", "Olivia", "Maya", "Leo", "Ava", "Marcão"]


// Intersect - pull out overlap

let experiencedSwiftUIDevs = swiftUIDevs.intersection(experiencedDevs)
print("Intersect:",  experiencedSwiftUIDevs)

// Subtract - pull out difference
let juniorDevelopers = swiftDevs.subtracting(experiencedDevs)
print("Subtract:", juniorDevelopers)

// Disjoint - check for overlap
print("Disjoint:", swiftUIDevs.isDisjoint(with: kotlinDevs))

// Union - combine
let mobileDevs = swiftDevs.union(swiftUIDevs).union(kotlinDevs)
print("Union:", mobileDevs)

// Exclusive
let specialist = swiftDevs.symmetricDifference(kotlinDevs)
print("Exclusive:", specialist)

// Subset
let subset = swiftUIDevs.isSubset(of: swiftDevs)
print("Subset:", subset)

// Superset
let superset = swiftDevs.isSuperset(of: swiftUIDevs)
print("Superset:", superset)

// Insert, Delete, Find
swiftDevs.insert("Joe")
swiftDevs.remove("Sean")
swiftDevs.contains("Maya")
