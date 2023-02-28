//
//  MovieListViewController.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import UIKit

class MovieListViewController: UIViewController {
    var viewModel: MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupData()
    }
    
    private func setupData() {
        viewModel.fetchMovies()
        viewModel.dataFound = { [weak self] in
            self?.refreshData()
        }
    }
    
    func refreshData() {
        DispatchQueue.main.async {
            
        }
    }
}
