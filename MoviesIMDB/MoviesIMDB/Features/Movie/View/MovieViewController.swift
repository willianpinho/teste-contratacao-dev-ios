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

    override func viewDidLoad() {
        super.viewDidLoad()

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
    private func setupData() {
        guard let currentMovie = self.movie else { return }
        viewModel.fetchMovie(movie: currentMovie)
    }
}
