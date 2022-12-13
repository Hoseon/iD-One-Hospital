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
    
    // MARK: - Properties
    private let doctorCard = DoctorCardSelect(docteName: "김민지 의사", status: "진료가능")
    private let doctorCard2 = DoctorCardSelect(docteName: "백귀덕 의사", status: "진료가능")
    
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
        
        view.addSubview(doctorCard)
        doctorCard.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        view.bringSubviewToFront(doctorCard)
        doctorCard.layer.zPosition = 1000;
        
        view.addSubview(doctorCard2)
        doctorCard2.snp.makeConstraints {
            $0.top.equalTo(doctorCard.snp.bottom).offset(170)
            $0.width.equalTo(doctorCard)
            $0.horizontalEdges.equalTo(doctorCard)
        }
        view.bringSubviewToFront(doctorCard2)
        doctorCard2.layer.zPosition = 1000;
        
        
    }
    
    // MARK: - Actions
    @objc func handleTap(sender:UITapGestureRecognizer) {
        print("tap")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let doctorView = DoctorDetailView()
        navigationController?.pushViewController(doctorView, animated: true)
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

