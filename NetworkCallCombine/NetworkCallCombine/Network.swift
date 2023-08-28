//
//  Network.swift
//  NetworkCallCombine
//
//  Created by Jeann Luiz on 25/08/23.
//

import Combine
import Foundation

func fetchMovies() -> some Publisher<MovieResponse, Error> {
    
    let apiKey = "e64f646c07736c13074da386282feaca"
    
    let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")!
    
    return URLSession
        .shared
        .dataTaskPublisher(for: url)
        .map(\.data)
        .print()
        .decode(type: MovieResponse.self, decoder: jsonDecoder)
        //.eraseToAnyPublisher()
}
