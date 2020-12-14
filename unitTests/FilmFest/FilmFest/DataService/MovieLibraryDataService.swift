//
//  MovieLibraryDataSource.swift
//  FilmFest
//
//  Created by Jeann Luiz on 14/12/20.
//

import UIKit

class MovieLibraryDataService: NSObject, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
