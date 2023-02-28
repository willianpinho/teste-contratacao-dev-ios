//
//  MovieListViewModel.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import Foundation

class MovieListViewModel {
    let webservice: WebService
    var movies: [Movie] = []
    var dataFound: (() -> ())?
    let movieItemSelected = DelegateView<Movie>()
    var viewDidDisappear = DelegateView<Void>()

    init(webservice: WebService) {
        self.webservice = webservice
    }
    
    func fetchMovies() {
        webservice.getTop250Movies { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self?.movies = movies
                    self?.dataFound?()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
