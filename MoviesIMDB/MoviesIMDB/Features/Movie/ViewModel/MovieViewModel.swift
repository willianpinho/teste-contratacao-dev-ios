//
//  MovieViewModel.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import Foundation

class MovieViewModel {
    let webservice: WebService
    var movie: Movie?

    var viewDidDisappear = DelegateView<Void>()
    var dataFound: (() -> ())?

    init(webservice: WebService) {
        self.webservice = webservice
    }
    
    func fetchMovie(movie: Movie) {
        webservice.getTitle(movie: movie) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movie):
                    self?.movie = movie
                    self?.dataFound?()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
