//
//  MovieStructTests.swift
//  FilmFestTests
//
//  Created by Jeann Luiz on 14/12/20.
//

import XCTest

@testable import FilmFest
class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Initialization
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Generic Blockbuster")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_SetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Generic Blockbuster", releaseDate: "1987")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1987")
    }
    
    // MARK: Equatable
    func testEquatable_ReturnTrue() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnNotEqualForDifferentTitles() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Drama")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnNotEqualForDifferentReleaseDates() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "1989")
        let actionMovie2 = Movie(title: "Action", releaseDate: "1980")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
}
