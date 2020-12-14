//
//  MovieLibraryDataServiceTests.swift
//  FilmFestTests
//
//  Created by Jeann Luiz on 14/12/20.
//

import XCTest

@testable import FilmFest
class MovieLibraryDataServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Sections
    func testTableViewSections_Count_ReturnTwo() {
        let dataService = MovieLibraryDataService()
        let tableView = UITableView()
        tableView.dataSource = dataService
        
        let sections = tableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    // MARK:

}
