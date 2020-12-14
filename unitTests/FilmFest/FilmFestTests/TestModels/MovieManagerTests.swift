//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Jeann Luiz on 14/12/20.
//

import XCTest

@testable import FilmFest
class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    let scifiMovie = Movie(title: "Sci-Fi")
    let actionMovie = Movie(title: "Action")
    let dramaMovie = Movie(title: "Drama")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initial values
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount , 0)
    }
        
    func testInit_MoviesSeen_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount , 0)
    }
    
    // MARK: Add & Query
    func testAdd_MoviesToSee_ReturnsOne() {
        sut.addMovie(movie: scifiMovie)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        sut.addMovie(movie: dramaMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(dramaMovie.title, movieQueried.title)
    }
    
    // MARK: Checking Off
    func testCheckOffMovie_UpdateMovieManagerCounts() {
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, actionMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: dramaMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(dramaMovie.title, movieQueried.title)
    }
    
    //MARK: Clearing and Reseting
    func testClearArrays_ReturnsArrayCountOfZero() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
        
    //MARK: Duplicates
    func testDuplicatesMovies_ShouldNotBeAddedToArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
}
