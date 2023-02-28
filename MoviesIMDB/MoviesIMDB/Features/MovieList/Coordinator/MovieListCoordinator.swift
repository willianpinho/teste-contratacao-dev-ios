//
//  MovieListCoordinator.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import UIKit

class MovieListCoordinator: BaseCoordinator {
    private var viewModel: MovieListViewModel = MovieListViewModel(webservice: WebService())
    
    override func start() {
        let movieListViewController = MovieListViewController()
        movieListViewController.viewModel = viewModel
        self.navigationController = UINavigationController(rootViewController: movieListViewController)
        self.navigationController.viewControllers = [movieListViewController]
    }
}
