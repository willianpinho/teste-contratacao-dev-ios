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
        setupBinding()

        let movieListViewController = MovieListViewController()
        movieListViewController.viewModel = viewModel
        self.navigationController = UINavigationController(rootViewController: movieListViewController)
        self.navigationController.viewControllers = [movieListViewController]
    }
    
    private func setupBinding() {
        viewModel.movieItemSelected.subscribe(to: self) { this, movie in
            if !AuthService.shared.userAuthenticated() {
                this.navigateToLogin()
            } else {
                this.navigateToMovie(movie: movie)
            }
        }
    }
    
    private func navigateToMovie(movie: Movie) {
        
        
        let movieCoordinator = MovieCoordinator(movie: movie)
        movieCoordinator.navigationController = navigationController
        start(coordinator: movieCoordinator)
    }
    
    private func navigateToLogin() {
        let loginCoordinator = LoginCoordinator()
        loginCoordinator.navigationController = navigationController
        start(coordinator: loginCoordinator)
    }
}
