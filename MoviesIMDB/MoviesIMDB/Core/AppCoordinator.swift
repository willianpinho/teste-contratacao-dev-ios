//
//  AppCoordinator.swift
//  MoviesIMDB
//
//  Created by Willian Junior Peres de Pinho on 28/02/23.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    private var window: UIWindow
    private unowned var sceneDelegate: SceneDelegate
    
    init(_ window: UIWindow, sceneDelegate: SceneDelegate) {
        self.window = window
        self.sceneDelegate = sceneDelegate
    }
    
    override func start() {
        let movieList = MovieListCoordinator()
        self.start(coordinator: movieList)
        
        window.rootViewController = movieList.navigationController
        window.makeKeyAndVisible()
    }
}
