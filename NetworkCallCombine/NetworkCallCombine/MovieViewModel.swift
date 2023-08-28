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
    func fetchInitialData() {
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
}
