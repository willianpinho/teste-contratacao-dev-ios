//
//  MovieViewController.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import UIKit

class MovieViewController: UIViewController {
    var viewModel: MovieViewModel!
    var movie: Movie?

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear.accept?(())
    }
}

extension MovieViewController {
    private func setupUI() {
        guard let currentMovie = movie else { return }
        posterImageView.load(fromUrl: currentMovie.image ?? "")
        titleLabel.text = currentMovie.fullTitle
        crewLabel.text = currentMovie.crew
        rateLabel.text = "Rating: " + (currentMovie.imDbRating ?? "")
        ratingLabel.text = "ImdbCounting: " + (currentMovie.imDbRatingCount ?? "")
    }
    
    private func setupData() {
        guard let currentMovie = self.movie else { return }
        viewModel.fetchMovie(movie: currentMovie)
    }
}
