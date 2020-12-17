//
//  MovieCellTests.swift
//  FilmFestTests
//
//  Created by Jeann Luiz on 14/12/20.
//

import XCTest

@testable import FilmFest
class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let libraryViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryViewController.view
        
        tableView = libraryViewController.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCell_Config_ShouldSetLabelsToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCellTableViewCell
        cell.configMovieCell(movie: Movie(title: "Comedy", releaseDate: "2018"))
        
        XCTAssertEqual(cell.textLabel?.text, "Comedy")
        XCTAssertEqual(cell.detailTextLabel?.text, "2018")
    }
}
