//
//  SceneDelegate.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var coordinator: AppCoordinator!
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window!.makeKeyAndVisible()
        
        // Create initialization of authentication in UserDefaults
        AuthService.shared.initializeAuthentication()
                
        coordinator = AppCoordinator(window!, sceneDelegate: self)
        coordinator.start()
    }
}
