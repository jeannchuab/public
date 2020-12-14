//
//  Movie.swift
//  FilmFest
//
//  Created by Jeann Luiz on 14/12/20.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

//lhs = left hand side
//rhs = right hand side
func == (lhs: Movie, rhs: Movie) -> Bool {
    
//    if (lhs.title != rhs.title) {
//        return false
//    }
//
//    if (lhs.releaseDate != rhs.releaseDate) {
//        return false
//    }
//
//    return true
    
    return (lhs.title == rhs.title) && (lhs.releaseDate == rhs.releaseDate)
}
