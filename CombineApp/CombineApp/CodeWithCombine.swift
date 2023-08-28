//
//  CodeWithCombine.swift
//  CombineApp
//
//  Created by Jeann Luiz on 24/08/23.
//

import Combine
import Foundation

/*
 Don't do this in a real project. A better place to store the AnyCancellable could be in the ViewModel for example.
 Once the viewModel is deallocated the AnyCancellable will be to, avoiding memory leaks.
 */
var cancellables = Set<AnyCancellable>()

func runWithCombine() {
    
    // Example 01
    //The "Just" could be used to run a mock value, simulate a return from a API for example
//    Just(42) //A publisher that emits an output to each subscriber just once, and then finishes.
//        .delay(for: 1, scheduler: DispatchQueue.main)
//        .sink { value in //Attaches a subscriber with closure-based behavior to a publisher that never fails.
//            print(value) //Will print the 42
//        }
//        .store(in: &cancellables) //The & means that the parameter is inout, could be modified inside the function
//
//    // Example 02
//    Just([1,2,3,4,5])
//        .sink { value in //Attaches a subscriber with closure-based behavior to a publisher that never fails.
//            print(value) //Will print the array one
//        }
//        .store(in: &cancellables) //The & means that the parameter is inout, could be modified inside the function
//
//    // Example 03
//    [1, 2, 3, 4, 5]
//        .publisher
//        .sink { value in //Attaches a subscriber with closure-based behavior to a publisher that never fails.
//            print(value) //Will print the each element of the array one by one
//        }
//        .store(in: &cancellables) //The & means that the parameter is inout, could be modified inside the function
    
    // Example 04: Same as Example 3 but using a filter
    [1, 2, 3, 4, 5]
        .publisher
//        .filter { value -> Bool in value.isMultiple(of: 2) == false } //Is the same as the line below
        .filter { $0.isMultiple(of: 2) == false }
        .map { $0 * $0 } // We can add this for manipulate the values, in this case we are calculanting a square math
        //.print() // This is could be used as debug helper, print what's is beeing received
        .sink { value in // Attaches a subscriber with closure-based behavior to a publisher that never fails.
            print(value) // Will print the each element of the array one by one
        }
        .store(in: &cancellables) //The & means that the parameter is inout, could be modified inside the function
    
}
