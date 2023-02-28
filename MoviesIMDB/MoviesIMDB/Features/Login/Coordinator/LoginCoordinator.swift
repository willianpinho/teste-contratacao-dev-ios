//
//  LoginCoordinator.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import UIKit

class LoginCoordinator: BaseCoordinator {
    private var viewModel: LoginViewModel = LoginViewModel()
    
    override func start() {
        setupBinding()
        
        let loginViewController = LoginViewController()
        loginViewController.viewModel = viewModel
        self.navigationController.present(loginViewController, animated: true)
    }
    
    private func setupBinding() {
        viewModel.viewDidDisappear.subscribe(to: self) { this, _ in
            this.parentCoordinator?.didFinish(coordinator: this)
        }
    }
}
