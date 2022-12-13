//
//  OnboardViewController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/16.
//

import Foundation
import UIKit
import SnapKit
import Then
import AdvancedPageControl

class OnboardViewController: UIViewController {
    // MARK: - Properties
    
    let loginVC = LoginController.shared
    
    var images = [
        "Img_Onboarding_01",
        "Img_Onboarding_02",
        "Img_Onboarding_03"]
    
    var pages: [UIView] = [OnboardView1(), OnboardView2(), OnboardView3()]
    
    private let scView = UIScrollView().then {
        $0.bounces = true
        $0.showsHorizontalScrollIndicator = false
    
    }
    
    
    private let pageCtrl = UIPageControl().then {
        
        $0.currentPageIndicatorTintColor = UIColor(red: 0.212, green: 0.75, blue: 0.98, alpha: 1)
        $0.numberOfPages = 3
        $0.currentPage = 0
        $0.pageIndicatorTintColor = .gray
        
        
    }
    
    private let confirmButton = UIButton(type: .system).then {
        $0.addTarget(self, action: #selector(pushToLogin), for: .touchUpInside)
        $0.setTitle("시작하기", for: .normal)
        $0.backgroundColor = UIColor(red: 0.212, green: 0.75, blue: 0.98, alpha: 1)
        $0.layer.cornerRadius = 12
        $0.setTitleColor(.white, for: .normal)
        
        $0.titleLabel?.attributedText = "시작하기".styled(with: bold20Style)
    }
    
    
    // MARK: - LifeCycle
//    override func viewDidLayoutSubviews() {
//        pageCtrl.subviews.forEach {
//            $0.transform = CGAffineTransform(scaleX: 2, y: 2)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        view.backgroundColor = .white
        //스크롤뷰 delegate 선언
        scView.delegate = self
        configureUI()
        setupScreens()
    }
    
    // MARK: - Helpers
    func configureUI() {
        //스크롤뷰 View에 넣기
        
        pageCtrl.numberOfPages = pages.count //페이지 수
        
        
        view.addSubview(scView)
        scView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(50)
            $0.width.equalToSuperview()
            $0.height.equalTo(600)
        }
        
      
        //페이지컨트롤 (인디케이터) 넣기
        view.addSubview(pageCtrl)
        pageCtrl.snp.makeConstraints {
            $0.bottom.equalTo(scView.snp.bottom).inset(62)
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(confirmButton)
        confirmButton.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(10)
        }
    }
    
    func setupScreens() {
        for index in 0..<images.count {
            let imageView = UIImageView()
            imageView.image = UIImage(named: images[index])
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(index)
            
            pages[index].frame = CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: 341)
            
            scView.contentSize.width = self.view.frame.width * CGFloat(1+index)
            
            scView.addSubview(pages[index])
            
        }
    }
    
    // MARK: - Actions
    @objc func pushToLogin() {
        let loginController = self.loginVC
        navigationController?.pushViewController(loginController, animated: true)
        
    }

}




// MARK: - Extenstions
extension OnboardViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.width
        pageCtrl.currentPage = Int(pageNumber)
    }
}

#if DEBUG

import SwiftUI

struct ViewControllerOnboardViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        OnboardViewController()
    }
}

struct ViewControllerOnboardViewControllerPrepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerOnboardViewControllerPresentable()
            .previewDevice("iPhone 12 mini")
            .previewDisplayName("iPhone 12 mini")
            .ignoresSafeArea()
    }
}

#endif

