//
//  MovieListViewController.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import UIKit

class MovieListViewController: UIViewController {
    var viewModel: MovieListViewModel!
    @IBOutlet weak var tableView: UITableView!
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
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

extension MovieListViewController {
    private func setupUI() {
        navigationItem.title = "Top 250 Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 325
        tableView.separatorStyle = .none
        tableView.register(
            UINib(nibName: MovieTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: MovieTableViewCell.identifier)
               
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)])
        activityIndicator.startAnimating()
    }
    
    private func setupData() {
        viewModel.fetchMovies()
        viewModel.dataFound = { [weak self] in
            self?.refreshData()
        }
    }
    
    func refreshData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.layoutSubviews()
            self.activityIndicator.stopAnimating()
        }
    }
}

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell {
            let movie = viewModel.movies[indexPath.row]
            cell.binding(model: movie)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.movieItemSelected.accept?(viewModel.movies[indexPath.row])
    }
}
