//
//  Select1ViewController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/28.
//

import Foundation
import UIKit
import Then
import SnapKit

class Select1ViewController: UIViewController {
    private let viewLabel = UILabel().then {
        $0.text = "test1"
        $0.textColor = .black
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white ]
        
        
        
        
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = UIColor(rgb: 0xF8F8F9)
        
        let doctorCard = DoctorCardSelect(docteName: "김민지 의사", status: "진료가능")
        let doctorCard2 = DoctorCardSelect(docteName: "백귀덕 의사", status: "진료가능")
        
        view.addSubview(doctorCard)
        doctorCard.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        view.addSubview(doctorCard2)
        doctorCard2.snp.makeConstraints {
            $0.top.equalTo(doctorCard.snp.bottom).offset(100)
            $0.width.equalTo(doctorCard)
            $0.horizontalEdges.equalTo(doctorCard)
            
            
        }
        
    }
}


#if DEBUG

import SwiftUI

struct Select1ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        Select1ViewController()
    }
}

struct Select1ViewControllerPrepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Select1ViewControllerPresentable()
            .previewDevice("iPhone 12 mini")
            .previewDisplayName("iPhone 12 mini")
            .ignoresSafeArea()
    }
}

#endif

