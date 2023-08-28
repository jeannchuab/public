//
//  MovieViewModel.swift
//  NetworkCallCombine
//
//  Created by Jeann Luiz on 25/08/23.
//

import Combine
import Foundation

final class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    var cancellables = Set<AnyCancellable>()
    
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
                self?.movies = movies
            }
            .store(in: &cancellables)
    }
    
    func fetchInitialData_Version2() {
        fetchMovies()
            .map(\.results)
            .receive(on: DispatchQueue.main) // Determine in which thread the code will be executed. Code that receive the value and does a side effect with them
            .replaceError(with: []) // Replaces any errors in the stream with the provided element, then finishes normally.
            .assign(to: \.movies, on: self) // Attention: This could cause a retain cycle. It's similar to the receiveValue on Version1.
            .store(in: &cancellables)
    }
    
    // That's the best syntax, clean and readable.
    func fetchInitialData_Version3() {
        fetchMovies()
            .map(\.results)
            .receive(on: DispatchQueue.main) // Determine in which thread the code will be executed. Code that receive the value and does a side effect with them
            .replaceError(with: []) // Replaces any errors in the stream with the provided element, then finishes normally.
            .assign(to: &$movies) // The method "assign" was introduced on iOS 14. & means a inout parameter, we are modifing the parameter. $ because the movies is @Published
    }
    
    func fetchInitialData_Version4() {
        fetchMovies()
            .map(\.results)
            .receive(on: DispatchQueue.main) // Determine in which thread the code will be executed. Code that receive the value and does a side effect with them
            .catch({ (error) in
                Just([])
            })
            .assign(to: &$movies) // The method "assign" was introduced on iOS 14. & means a inout parameter, we are modifing the parameter. $ because the movies is @Published
    }
}
