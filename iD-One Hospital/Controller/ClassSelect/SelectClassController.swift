//
//  ClassSelectController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/25.
//

import Foundation
import UIKit

class SelectClassController: UIViewController {
    // MARK: - Properties
    
    private lazy var headerLabel = UILabel().then {
        $0.attributedText = attributedStateText(label1: "진료과", label2: "를 선택해주세요")
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(rgb: 0xF8F8F9)
        overrideUserInterfaceStyle = .light
        configureNavi()
        configureUi()
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
        navigationItem.title = "비대면 진료실"
        
    }
    
    func configureUi() {
        view.addSubview(headerLabel)
        headerLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        let room1 = RoomCell(iconName: "icn_1", btnText: "내과")
        let room2 = RoomCell(iconName: "icn_2", btnText: "정형외과")
        let room3 = RoomCell(iconName: "icn_3", btnText: "산부인과")
        room1.delegate = self //CustomView에 Delegate 버튼 작동연결
        room2.delegate = self
        room3.delegate = self
        
        let hstack1 = UIStackView(arrangedSubviews: [
            room1,
            room2,
            room3,
        ])
        view.addSubview(hstack1)
        hstack1.axis = .horizontal
        hstack1.distribution = .fillEqually
        hstack1.snp.makeConstraints {
            $0.height.equalTo(102)
            $0.top.equalTo(headerLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
        }
        
        let room4 = RoomCell(iconName: "icn_4", btnText: "소아청소년과")
        let room5 = RoomCell(iconName: "icn_5", btnText: "정형외과")
        let room6 = RoomCell(iconName: "icn_6", btnText: "산부인과")
        room4.delegate = self
        room5.delegate = self
        room6.delegate = self
            
        let hstack2 = UIStackView(arrangedSubviews: [
            room4,
            room5,
            room6
        ])
        
        view.addSubview(hstack2)
        hstack2.axis = .horizontal
        hstack2.distribution = .fillEqually
        hstack2.snp.makeConstraints {
            $0.height.equalTo(102)
            $0.top.equalTo(hstack1.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()

        }
        
        let room7 = RoomCell(iconName: "icn_7", btnText: "비뇨기과")
        let room8 = RoomCell(iconName: "icn_8", btnText: "가정의학과")
        room7.delegate = self
        room8.delegate = self
        
        view.addSubview(room7)
        room7.snp.makeConstraints {
            $0.width.equalTo(102)
            $0.height.equalTo(hstack2.snp.height)
            $0.top.equalTo(hstack2.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        view.addSubview(room8)
        room8.snp.makeConstraints {
            $0.width.equalTo(102)
            $0.height.equalTo(hstack2.snp.height)
            $0.top.equalTo(hstack2.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            
        }
    }
    
    func attributedStateText(label1: String, label2: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: label1, attributes: [.font: UIFont(name: "Pretendard-Bold", size: 22)])
        attributedText.append(NSAttributedString(string: label2, attributes: [.font: UIFont(name: "Pretendard", size: 22), .foregroundColor: UIColor.lightGray]))
        
        return attributedText
    }
    
    
    // MARK: - Actions
    @objc func backbutton() {
        print(#fileID, #function, #line, "-")
        self.navigationController?.popViewController(animated: true)
    }
}

extension SelectClassController: RoombuttonDelegate {
    func didTapButton() {
        let doctorSelect = DoctorSelectViewController()
        self.navigationController?.pushViewController(doctorSelect, animated: true)
    }
}
