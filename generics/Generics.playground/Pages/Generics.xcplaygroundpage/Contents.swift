import Foudation

func equals<T: Equatable>(lhs: T, rhs: T) -> Bool {
    return lhs == rhs
}

equals(lhs: "abdc", rhs: "fgdt")
equals(lhs: Double.pi, rhs: 3.14)

let date1 = Array(repeating: 1, count: 2)
let date2 = Array(repeating: 1, count: 10)

equals(lhs: date1, rhs: date2)
