//
//  MedicalListController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/10.

import Foundation
import UIKit
import Then
import SnapKit

class MedicalListController: UIViewController {
    
    // MARK: - Properties
    private let doctorCard = DoctorCardCell(date: "2022-11-23 (수)", requestTime: "14:00", name: "김민지 의사", hosiptalName: "디젠트아이디병원", targetName: "백귀덕 (본인)")
    private let doctorCard2 = DoctorCardCell()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //화면 자체를 라이트 모드로 변경
        overrideUserInterfaceStyle = .light
        view.backgroundColor = UIColor(rgb: 0xF8F8F9)
        setupNavigation()
        configureUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK: - Helplers
    func setupNavigation() {
        self.navigationController?.navigationBar.isHidden = false
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        self.navigationItem.title = "진료 내역"
    }
    
    func configureUI() {
        view.addSubview(doctorCard)
        doctorCard.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.width.equalTo(350)
            $0.height.equalTo(274)
        }
        
        view.addSubview(doctorCard2)
        doctorCard2.snp.makeConstraints {
            $0.top.equalTo(doctorCard.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.width.equalTo(350)
            $0.height.equalTo(274)
        }
        
    }
    
}
