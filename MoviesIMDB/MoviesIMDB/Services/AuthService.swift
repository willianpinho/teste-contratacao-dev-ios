//
//  AuthService.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import Foundation

class AuthService {
    let defaults = UserDefaults.standard
    static let shared = AuthService()

    private init(){}

    func initializeAuthentication() {
        defaults.set(false, forKey: "UserAuthenticated")
    }
    
    func authenticate(bool: Bool) {
        defaults.set(true, forKey: "UserAuthenticated")
    }
    
    func userAuthenticated() -> Bool {
        return defaults.bool(forKey: "UserAuthenticated")
    }
}
