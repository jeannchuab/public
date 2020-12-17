//
//  MovieLibraryDataServiceTests.swift
//  FilmFestTests
//
//  Created by Jeann Luiz on 14/12/20.
//

import XCTest

@testable import FilmFest
class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    var libraryViewController: LibraryViewController!
    var tableViewMock: TableViewMock!
    
    let fairyTaleMovie = Movie(title: "Fairy Tale")
    let horrorMovie = Movie(title: "Horror")
    let darkComedyMovie = Movie(title: "Dark Comedy")

    override func setUpWithError() throws {
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        libraryViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewControllerID") as? LibraryViewController
        _ = libraryViewController.view
        
        libraryTableView = libraryViewController.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Sections
    func testTableViewSections_Count_ReturnTwo() {
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnsMoviesToSeeCount() {
        sut.movieManager?.addMovie(movie: fairyTaleMovie)
        sut.movieManager?.addMovie(movie: darkComedyMovie)
        libraryTableView.reloadData()

        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)

        sut.movieManager?.addMovie(movie: horrorMovie)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesSeenCount() {
        sut.movieManager?.addMovie(movie: fairyTaleMovie)
        sut.movieManager?.addMovie(movie: darkComedyMovie)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)

        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)

        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)
    }
    
    // MARK: Cells
    func testCell_RowAtIndex_ReturnsMovieCell() {
        sut.movieManager?.addMovie(movie: darkComedyMovie)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cellQueried is MovieCellTableViewCell)
    }
    
    func testCell_ShouldDequeueCell() {
        sut.movieManager?.addMovie(movie: horrorMovie)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: fairyTaleMovie)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellTableViewCellMock
        XCTAssertEqual(cell.movieData, fairyTaleMovie)
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: darkComedyMovie)
        sut.movieManager?.addMovie(movie: fairyTaleMovie)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellTableViewCellMock
        XCTAssertEqual(cell.movieData, darkComedyMovie)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie() {
        sut.movieManager?.addMovie(movie: fairyTaleMovie)
        sut.movieManager?.addMovie(movie: darkComedyMovie)
        
        libraryTableView.delegate?.tableView?(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValues() {
        let section1Title = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 0)
        let section2Title = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies to See")
        XCTAssertEqual(section2Title, "Movies Seen")
    }
}

