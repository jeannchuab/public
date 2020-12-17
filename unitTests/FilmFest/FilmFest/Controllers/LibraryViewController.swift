//
//  ViewController.swift
//  FilmFest
//
//  Created by Jeann Luiz on 14/12/20.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releaseDate: "1989"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Crime", releaseDate: "1979"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Adventure"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Drama", releaseDate: "1995"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Sci-Fi"))
//        dataService.movieManager?.addMovie(movie: Movie(title: "Comedy", releaseDate: "1945"))
//        dataService.movieManager?.addMovie(movie: Movie(title: "Dark Comedy"))
    }
}

