//
//  PayCompleteViewController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/12/08.
//

import Foundation
import UIKit
import Then
import SnapKit
import BonMot

class PayCompleteViewController: UIViewController {
    // MARK: - Properties
    private let completeImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "icn_completed")
    }
    
    private var message = UILabel().then {
        $0.attributedText = "김민지 의사에게 \n진료 신청이 전달되었습니다.".styled(with: bold22Style)
        $0.textAlignment = .center
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.font = UIFont(name: "Pretendard-Bold", size: 20)
        $0.textColor = UIColor(red: 0.262, green: 0.262, blue: 0.262, alpha: 1)
        
        
    }
    
    private let uiView = UIView().then {
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 0.941, green: 0.976, blue: 1, alpha: 1)
    }
    
    private var viewText = UILabel().then {
        $0.attributedText = "진료신청이 확정되면 알림을 보내드립니다.".styled(with: bold16Style)
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
        $0.textColor = UIColor(red: 0.006, green: 0.416, blue: 0.637, alpha: 1)
        
    }
    
    private let homeButton = UIButton(type: .system).then {
        $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 20)
        $0.isEnabled = true
        $0.addTarget(self, action: #selector(pushToHome), for: .touchUpInside)
        $0.setTitle("홈으로 이동하기", for: .normal)
        $0.backgroundColor = UIColor(red: 0.212, green: 0.75, blue: 0.98, alpha: 1)
        $0.layer.cornerRadius = 12
        $0.setTitleColor(.white, for: .normal)
    }
    
    
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configurUI()
    }
    
    // MARK: - Helpers
    func configureNavi() {
        self.navigationController?.setToolbarHidden(false, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white ]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backbutton"), style: .plain, target: self, action: #selector(backbutton))
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor.white
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        navigationItem.title = "진료 신청"
    }
    
    func configurUI() {
        view.backgroundColor = .white
        
        uiView.addSubview(viewText)
        viewText.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        
        let stackView = UIStackView(arrangedSubviews: [completeImage, message, uiView])
        stackView.axis = .vertical
        stackView.spacing = 16
        
        
        uiView.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.horizontalEdges.equalToSuperview().inset(20)
            
        }
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.width.equalToSuperview()
            
            $0.centerX.centerY.equalToSuperview()
        }
        
        view.addSubview(homeButton)
        homeButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(58)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        
    }
    
    // MARK: - Actions
    @objc func backbutton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func pushToHome() {
        let controller = MainTabController()
        self.view.window?.rootViewController = controller
//        UINavigationController(rootViewController: controller)
//        navigationController?.pushViewController(controller, animated: true)
    }
    
}

#if DEBUG

import SwiftUI

struct PayCompleteViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        PayCompleteViewController()
    }
}

struct PayCompleteViewControllerPrepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        PayCompleteViewControllerPresentable()
            .previewDevice("iPhone 12 mini")
            .previewDisplayName("iPhone 12 mini")
            .ignoresSafeArea()
    }
}

#endif


