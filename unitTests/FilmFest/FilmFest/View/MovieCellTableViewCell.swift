//
//  MovieCellTableViewCell.swift
//  FilmFest
//
//  Created by Jeann Luiz on 14/12/20.
//

import UIKit

class MovieCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configMovieCell(movie: Movie) {
        self.textLabel?.text = movie.title
        self.detailTextLabel?.text = movie.releaseDate
    }

}
