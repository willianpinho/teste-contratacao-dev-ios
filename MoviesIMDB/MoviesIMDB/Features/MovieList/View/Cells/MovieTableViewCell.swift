//
//  MovieTableViewCell.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func binding(model: Movie) {
        movieImageView.load(fromUrl: model.image ?? "")
        titleLabel.text = model.fullTitle
        directorLabel.text = model.crew
        rateLabel.text = "Rating: " + (model.imDbRating ?? "")
        ratingLabel.text = "ImdbCounting: " + (model.imDbRatingCount ?? "")
    }
}
