//
//  MovieCoordinator.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import UIKit

class MovieCoordinator: BaseCoordinator {
    private var movie: Movie?
    private var viewModel: MovieViewModel = MovieViewModel(webservice: WebService())
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    override func start() {
        setupBinding()
        
        let movieViewController = MovieViewController()
        movieViewController.viewModel = viewModel
        movieViewController.movie = movie
        self.navigationController.pushViewController(movieViewController, animated: true)
    }
    
    private func setupBinding() {
        viewModel.viewDidDisappear.subscribe(to: self) { this, _ in
            this.parentCoordinator?.didFinish(coordinator: this)
        }
    }
}
