//
//  LoginViewController.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import UIKit

class LoginViewController: UIViewController {
    var viewModel: LoginViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        AuthService.shared.authenticate(bool: true)
        viewModel.viewDidDisappear.accept?(())
    }
}
