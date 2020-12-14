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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
    }
}

