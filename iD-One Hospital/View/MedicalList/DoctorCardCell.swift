//
//  DoctorCardCell.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/23.
//

import Foundation
import UIKit
import Then
import SnapKit

class DoctorCardCell: UIView {
    
    var onClicked: (()-> Void)? = nil
    // MARK: - Properties
    private let headerStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .leading
    }
    
    private let hStackView = UIStackView().then {
        $0.spacing = 8
        $0.alignment = .center
        $0.axis = .horizontal
        
    }
    
    private let vStackView = UIStackView().then {
        $0.alignment = .leading
        $0.spacing = 4
        $0.axis = .vertical
    }
    
    private let headerDateLabel = UILabel().then {
        $0.attributedText = "2022-07-04 (월)".styled(with: bold24Style)
    }
    
    private let headerRequestTimeLabel = UILabel().then {
        $0.attributedText = "신청시간".styled(with: bold16Style)
    }
    
    private let headerTimeLabel = UILabel().then {
        $0.attributedText = "09:10".styled(with: regular14Style)
    }
    
    private let requestLabel = UILabel().then {
        $0.layer.backgroundColor = UIColor(rgb: 0x32D583).cgColor
        $0.layer.cornerRadius = 13
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
        $0.textColor = .white
        $0.text = "신청완료"
        $0.snp.makeConstraints {
            $0.width.equalTo(75)
            $0.height.equalTo(28)
        }
    }
    
    private let requestStatus = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0x32D583)
        $0.layer.cornerRadius = 15
        $0.snp.makeConstraints {
            $0.width.equalTo(72)
            $0.height.equalTo(25)
        }
    }
    
    private let divider = UIView().then {
        $0.backgroundColor = .gray
    }
    
    private let doctorName = UILabel().then {
//        $0.numberOfLines = 0
        $0.font = UIFont(name: "Pretendard-Bold", size: 20)
        $0.textColor = .black
        $0.text = "김민지 의사"
    }
    
    private let departLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.layer.backgroundColor = UIColor(rgb: 0xF8F8F9).cgColor
        $0.layer.borderColor = UIColor(rgb: 0xB3B3B3).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 13
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.textColor = .black
        $0.text = "내과"
        $0.snp.makeConstraints {
            $0.width.equalTo(45)
            $0.height.equalTo(28)
        }
    }
    
    private let hospitalName = UILabel().then {
        $0.numberOfLines = 0
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.textColor = .black
        $0.text = "병원명"
    }
    
    private let hospital = UILabel().then {
        $0.textColor = UIColor(rgb: 0x808080)
//        $0.numberOfLines = 0
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.text = "연세대학교의과대학세브란스병원"
    }
    
    private let targetName = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.textColor = .black
        $0.text = "환자명"
    }
    
    private let target = UILabel().then {
        $0.textColor = UIColor(rgb: 0x808080)
        $0.numberOfLines = 0
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.text = "김민지 (본인)"
    }
    
    private let doctorImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "doctor")
    }
    
    private let confirmButton = UILabel().then {
        $0.layer.backgroundColor = UIColor(rgb: 0xECFDF3).cgColor
        $0.layer.cornerRadius = 10
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.textColor = UIColor(rgb: 0x027A48)
        $0.text = "진료신청이 확정되면 알림을 보내드립니다."
    }
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(gesture)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        
        hStackView.addArrangedSubview(headerRequestTimeLabel)//신청시간
        hStackView.addArrangedSubview(headerTimeLabel)//09:10
        vStackView.addArrangedSubview(headerDateLabel) //2022-07-04 (월)
        requestStatus.addSubview(requestLabel) //
        vStackView.addArrangedSubview(hStackView) //
        headerStackView.addArrangedSubview(vStackView)
        headerStackView.addArrangedSubview(requestLabel) //신청완료 레이어에 넣기
        
        self.addSubview(headerStackView)
        headerStackView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(20)
        }
        
        self.addSubview(divider)
        divider.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(0.5)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.top.equalTo(headerStackView.snp.bottom).offset(20)
        }
        
        let doctorStack = UIStackView(arrangedSubviews: [doctorName, departLabel])
//        doctorStack.backgroundColor = .red
//        doctorStack.alignment = .leading
        doctorStack.axis = .horizontal
        doctorStack.spacing = 8
        doctorStack.snp.makeConstraints {
            $0.width.equalTo(135)
            $0.height.equalTo(30)
        }
        
        let hospitalStack = UIStackView(arrangedSubviews: [hospitalName, hospital])
        hospitalStack.axis = .horizontal
        hospitalStack.spacing = 8
        hospitalStack.snp.makeConstraints {
            $0.width.equalTo(211)
            $0.height.equalTo(42)
        }
        
        let targetStack = UIStackView(arrangedSubviews: [targetName, target])
        targetStack.axis = .horizontal
        targetStack.spacing = 8
        targetStack.snp.makeConstraints {
            $0.width.equalTo(117)
            $0.height.equalTo(21)
        }
        
        
        
        let middleLabelStack = UIStackView(arrangedSubviews: [doctorStack, hospitalStack, targetStack])
        middleLabelStack.axis = .vertical
        
        
        
        let middleStack = UIStackView(arrangedSubviews: [middleLabelStack, doctorImage])
        middleStack.axis = .horizontal
        middleStack.spacing = 10
        
        doctorImage.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(80)
        }
        
        self.addSubview(middleStack)
        middleStack.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(20)
//            $0.width.equalTo(250)
        }
        
        addSubview(confirmButton)
        confirmButton.snp.makeConstraints {
            $0.left.equalTo(middleStack.snp.left).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
            $0.bottom.equalTo(middleLabelStack.snp.bottom).offset(60)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(date: String,
                     requestTime: String,
                     name: String,
                     hosiptalName: String,
                     targetName: String
    ) {
        self.init()
        self.headerDateLabel.text = date
        self.headerTimeLabel.text = requestTime
        self.doctorName.text = name
        self.hospital.text = hosiptalName
        self.target.text = targetName
    }
    
    
    // MARK: - Helpers
    
    
    // MARK: - Actions
    @objc fileprivate func onButtonClicked(_ sender: UIButton) {
        print(#fileID, #function, #line, "-")
        onClicked?()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("tap")
    }
    
    
}

#if DEBUG
import SwiftUI

struct DoctorCardCell_Preivews: PreviewProvider {
    static var previews: some View {
        DoctorCardCell()
            .getRepresentable()
            .frame(maxWidth: 350)
            .frame(height: 274)
    }
}

#endif
