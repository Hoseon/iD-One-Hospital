//
//  MainTabController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/10.
//

import UIKit

class MainTabController: UITabBarController {
    // MARK: - Properties
    
    
    // MARK: - 라이프싸이클 영역
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 105
        tabBar.frame.origin.y = view.frame.height - 105
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        setUpNavigation()
        setUpTabBar()
        configureViewController()
        
    }
    
    // MARK: - Helpers
    func setUpNavigation() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    func setUpTabBar() {
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 12)
    }

    func configureViewController() {
        view.backgroundColor = .white
        let home = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: HomeController())
        let medical = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "list_unselected"), selectedImage: #imageLiteral(resourceName: "list_selected"), rootViewController: MedicalListController())
        let mypage = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "mypage_unselected"), selectedImage: #imageLiteral(resourceName: "mypage_selected"), rootViewController: MyPageController())
        viewControllers = [home, medical, mypage]
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
}

extension CALayer {
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }
}

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}

#if DEBUG

import SwiftUI

struct MainTabControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UITabBarController {
        MainTabController()
    }
}

struct MainTabControllerPrepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        MainTabControllerPresentable()
            .previewDevice("iPhone 12 mini")
            .previewDisplayName("iPhone 12 mini")
            .ignoresSafeArea()
    }
}

#endif


