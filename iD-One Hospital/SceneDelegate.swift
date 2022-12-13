//
//  SceneDelegate.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/10.
//

import UIKit
protocol ScenebuttonDelegate {
    func didPushButton()
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    let loginVC = LoginController.shared
    
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
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let incomingURL = userActivity.webpageURL,
              let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true),
              let path = components.path else { return }
        
        let params = components.queryItems ?? [URLQueryItem]()
        print("path = \(incomingURL)")
        print("params = \(params)")
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        
        guard let url = URLContexts.first?.url else { return }
        
        switch url {
        case URL(string: "idonehospital://ok") :
            DispatchQueue.main.async {
                self.loginVC.showPopUpOneButton(title: "알림",
                                                message: "로그인이 성공하였습니다.",
                                                rightActionTitle: "확인",
                                                rightActionCompletion:  {
                    self.loginVC.navigationController?.pushViewController(MainTabController(), animated: true)
                })
            }
        case URL(string: "idonehospital://paymentOK") :
            DispatchQueue.main.async {
                self.loginVC.showPopUpOneButton(title: "알림",
                                                message: "결제가 완료 되었습니다.",
                                                rightActionTitle: "확인",
                                                rightActionCompletion:  {
//                    self.window?.rootViewController = MainTabController()
                    self.loginVC.navigationController?.pushViewController(PayCompleteViewController(), animated: true)
                })
            }
        default:
            return
        }
        
        
        
    }
}

