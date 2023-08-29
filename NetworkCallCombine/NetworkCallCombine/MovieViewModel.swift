//
//  MovieViewModel.swift
//  NetworkCallCombine
//
//  Created by Jeann Luiz on 25/08/23.
//

import Combine
import Foundation

final class MovieViewModel: ObservableObject {
    @Published private var upcomingMovies: [Movie] = []
    @Published var searchQuery: String = ""
    @Published private var searchResults: [Movie] = []
    
    var movies: [Movie] {
        if searchQuery.isEmpty {
            return upcomingMovies
        } else {
            return searchResults
        }
    }
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        // The listener of the subscription
        
        /* This code has a little problem in the follow use case:
         User input a text
         API Request is call, for some reason is slow
         User input a new text
         API Request is call, for some reason is faster then the first one
         So we update the screen with the second response and after the second response will be overwritten with the first one
         
         $searchQuery
             .debounce(for: 0.3, scheduler: DispatchQueue.main) // This avoid a new search everytime the user type a new char. So is best to wait a bit before a new search be executed.
             .flatMap { searchQuery in //If you have a Publisher of Publisher flatMap give you a Publisher, it's a way to lose a dimension
                 searchMovies(for: searchQuery)
                     .replaceError(with: MovieResponse(results: []))
             }
             .map(\.results)
             .receive(on: DispatchQueue.main)
             .assign(to: &$searchResults)
         
         */

        // Changing the flatMap to Map and adding the switchToLatest we make sure to display the correct value, similar to flatMapLastest from RxSwift
        $searchQuery
            .debounce(for: 0.3, scheduler: DispatchQueue.main) // This avoid a new search everytime the user type a new char. So is best to wait a bit before a new search be executed.
            .map { searchQuery in //If you have a Publisher of Publisher flatMap give you a Publisher, it's a way to lose a dimension
                searchMovies(for: searchQuery)
                    .replaceError(with: MovieResponse(results: []))
            }
            .switchToLatest()
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .assign(to: &$searchResults)
    }
    
    //MARK: - Fetch
    
    // You never want to do anything with high cost in the init of a SwiftUI view
    func fetchInitialData_Version1() {
        fetchMovies()
            .map(\.results)
//            .subscribe(on: DispatchQueue.) // Attention: subscribe and receive are easily misundertood
            .receive(on: DispatchQueue.main) // Determine in which thread the code will be executed. Code that receive the value and does a side effect with them
            .sink { completion in
                switch completion {
                case .finished:()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
                    
            } receiveValue: { [weak self] movies in
                self?.upcomingMovies = movies
            }
            .store(in: &cancellables)
    }
    
    func fetchInitialData_Version2() {
        fetchMovies()
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .replaceError(with: []) // Replaces any errors in the stream with the provided element, then finishes normally.
            .assign(to: \.upcomingMovies, on: self) // Attention: This could cause a retain cycle. It's similar to the receiveValue on Version1.
            .store(in: &cancellables)
    }
    
    // That's the best syntax, clean and readable.
    func fetchInitialData_Version3() {
        fetchMovies()
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .replaceError(with: []) // Replaces any errors in the stream with the provided element, then finishes normally.
            .assign(to: &$upcomingMovies) // The method "assign" was introduced on iOS 14. & means a inout parameter, we are modifing the parameter. $ because the movies is @Published
    }
    
    func fetchInitialData_Version4() {
        fetchMovies()
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .catch({ (error) in // Handle the error
                Just([])
            })
            .assign(to: &$upcomingMovies) // The method "assign" was introduced on iOS 14. & means a inout parameter, we are modifing the parameter. $ because the movies is @Published
    }                   
}
