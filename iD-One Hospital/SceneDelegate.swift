//
//  SceneDelegate.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/10.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let viewController = PermissionController()
        
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        self.window?.makeKeyAndVisible()
        
//        let viewController = LoginController()
//        let viewController = PermissionController()
//        let viewController = OnboardViewController()
//        let viewController = LoginController()
//        let viewController = MainTabController()
//        let viewController = TestController()
//        self.window?.rootViewController = viewController
                
//        window.rootViewController = viewController
        
        
        
        
    }

    

}

