//
//  PaymentViewController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/12/08.
//

import Foundation
import UIKit
import Then
import SnapKit

class PaymentViewController: UIViewController {
    
    // MARK: - Properties
    private let headerView = HeaderView()
    
    private let paymentView = PaymentUIRadio()
    
    private let divider = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0xF8F8F9)
    }
    
    private let divider2 = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0xF8F8F9)
    }
    
    private let paymentButton = UIButton(type: .system).then {
        $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 20)
        $0.isEnabled = true
        $0.addTarget(self, action: #selector(pushToPayCompleted), for: .touchUpInside)
        $0.setTitle("55,000원 결제하기", for: .normal)
        $0.backgroundColor = UIColor(red: 0.212, green: 0.75, blue: 0.98, alpha: 1)
        $0.layer.cornerRadius = 12
        $0.setTitleColor(.white, for: .normal)
    }
    
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureNavi()
        configureUI()
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
    
    func configureUI() {
        view.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(243)
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        view.addSubview(divider)
        divider.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(16)
            $0.top.equalTo(headerView.snp.bottom)
        }
        
        view.addSubview(paymentView)
        paymentView.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(240)
            
        }
        
        view.addSubview(divider2)
        divider2.snp.makeConstraints {
            $0.top.equalTo(paymentView.snp.bottom).offset(30)
            $0.width.equalToSuperview()
            $0.height.equalTo(16)
        }
        
        view.addSubview(paymentButton)
        paymentButton.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    // MARK: - Actions
    @objc func pushToPayCompleted() {
        showPopUpTwoButton(title: "결제", message: "결제를 위해서 iD•One\n인증을 진행 합니다", rightActionCompletion: confirm)
    }
    @objc func backbutton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func confirm() {
        print(#fileID, #function, #line, "-확인 버튼 누름")
        let url = "metaDNA://https://devapi.metadna.kr/api/qr/scan/PAYMENT"
        if let openApp = URL(string: url), UIApplication.shared.canOpenURL(openApp) {
            UIApplication.shared.openURL(openApp)
        } else {
            print(#fileID, #function, #line, "-앱을 열지 못함")
        }
    }
    
    
}


#if DEBUG

import SwiftUI

struct PaymentViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        PaymentViewController()
    }
}

struct PaymentViewControllerPrepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        PaymentViewControllerPresentable()
            .previewDevice("iPhone 12 mini")
            .previewDisplayName("iPhone 12 mini")
            .ignoresSafeArea()
    }
}

#endif
