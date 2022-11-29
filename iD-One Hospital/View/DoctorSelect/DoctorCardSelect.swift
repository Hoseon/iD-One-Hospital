//
//  DoctorCardSelect.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/29.
//

import Foundation
import UIKit
import Then
import SnapKit
import BonMot

class DoctorCardSelect: UIView {
    
    private let uiView = UIView().then {
        $0.layer.backgroundColor = UIColor.systemYellow.cgColor
        $0.layer.cornerRadius = 16
    }
    
    private let doctorImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "doctorkim")
    }
    
    private var doctorName = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 24)
        $0.text = "임유진 의사"
    }
    
    private let hospitalName = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
        $0.text = "부산 카톨릭대학교 병원"
    }
    
    private let uiViewStatus = UIView().then {
        $0.layer.backgroundColor = UIColor(rgb: 0x32D583).cgColor
        $0.layer.cornerRadius = 16
        
    }
    
    private var status = UILabel().then {
        $0.text = "진료가능"
        $0.textColor = .white
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(uiView)
        uiView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(148)
        }
        
        uiView.addSubview(doctorImage)
        doctorImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview().offset(16)
        }
        
        uiView.addSubview(doctorName)
        doctorName.snp.makeConstraints {
            $0.top.equalTo(doctorImage.snp.top)
            $0.left.equalTo(doctorImage.snp.right).offset(12)
        }
        
        uiView.addSubview(hospitalName)
        hospitalName.snp.makeConstraints {
            $0.top.equalTo(doctorName.snp.bottom)
            $0.left.equalTo(doctorName.snp.left)
        }
        
        uiViewStatus.addSubview(status)
        status.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        uiView.addSubview(uiViewStatus)
        uiViewStatus.snp.makeConstraints {
            $0.width.equalTo(72)
            $0.height.equalTo(30)
            $0.top.equalTo(doctorName.snp.top)
            $0.right.equalToSuperview().inset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(docteName: String, status: String) {
        self.init()
        self.doctorName.text = docteName
        self.status.text = status
    }
    
    
    
}

#if DEBUG
import SwiftUI

struct DoctorCardSelect_Preivews: PreviewProvider {
    static var previews: some View {
        DoctorCardSelect()
            .getRepresentable()
            .frame(maxWidth: 400)
            .frame(height: 148)
    }
}

#endif


