//
//  movieDetailsCell.swift
//  RxTrendingMovies
//
//  Created by Ranjana Patidar on 15/07/22.
//

import UIKit

class movieDetailsCell: UITableViewCell {

    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var hgtContraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setUpCell(_ dictTrendingMovie: MovieListModel) {
        lblDescription.text = dictTrendingMovie.overview
        lblReleaseDate.text = "Release date: \(dictTrendingMovie.releaseDate!)"
        lblTitle.text = dictTrendingMovie.title
        lblRating.text = "\(dictTrendingMovie.voteAverage!.rounded()) / 10"
        hgtContraint.constant = dictTrendingMovie.title!.heightForView(font: UIFont.boldSystemFont(ofSize: 20), width: self.contentView.frame.size.width - 20)
    }
}
