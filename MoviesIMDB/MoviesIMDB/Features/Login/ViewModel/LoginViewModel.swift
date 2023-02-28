//
//  LoginViewModel.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import Foundation

class LoginViewModel {
    var viewDidDisappear = DelegateView<Void>()

    init() {
    }
    
    func authenticateUser(username: String, password: String, completion: @escaping (Bool) -> Void) {
        if username == "admin" && password == "admin" {
            AuthService.shared.authenticate(bool: true)
            completion(true)
        } else {
            AuthService.shared.authenticate(bool: false)
            completion(false)
        }
    }
}
