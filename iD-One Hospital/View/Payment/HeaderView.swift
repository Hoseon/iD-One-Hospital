//
//  HeaderView.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/12/08.
//

import Foundation
import UIKit
import Then
import SnapKit

class HeaderView: UIView {
    // MARK: - Properties
    private let jinryobi = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 22)
        $0.text = "진료비 결제"
        $0.textColor = .black
    }
    
    private let amountLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 22)
        $0.textColor = UIColor(rgb: 0x36BFFA)
        $0.text = "55,000원"
    }
    
    private let jinryoDesc = UILabel().then {
        $0.text = "진료비를 미리 결제 해주셔야 진료 신청이 가능합니다.\n진료 전 취소 시 결제 수단으로 환불됩니다."
        $0.font = UIFont(name: "Pretendard", size: 14)
        $0.textColor = UIColor(rgb: 0x808080)
        $0.numberOfLines = 0
    }
    
    private let divider = UIView().then {
        $0.backgroundColor = UIColor(rgb: 0xE6E6E6)
    }
    
    private let name = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
        $0.textColor = UIColor(rgb: 0x5C5C5C)
        $0.text = "사용자 이름"
    }
    
    private let phone = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
        $0.textColor = UIColor(rgb: 0x5C5C5C)
        $0.text = "전화번호"
    }
    
    private let jinryobiLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
        $0.textColor = UIColor(rgb: 0x5C5C5C)
        $0.text = "진료비"
    }
    
    private let service = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 14)
        $0.textColor = UIColor(rgb: 0x5C5C5C)
        $0.text = "서비스 이용료 (부가세 포함)"
    }
    
    private let nameRight = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.textColor = UIColor(rgb: 0x808080)
        $0.text = "홍길동"
    }
    
    private let phoneRight = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.textColor = UIColor(rgb: 0x808080)
        $0.text = "010-****-****"
    }
    
    private let jinryobiRight = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.textColor = UIColor(rgb: 0x808080)
        $0.text = "50,000원"
    }
    
    private let serviceRight = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 14)
        $0.textColor = UIColor(rgb: 0x808080)
        $0.text = "5,500원"
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .systemYellow
        addSubview(jinryobi)
        jinryobi.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(20)
        }
        
        addSubview(amountLabel)
        amountLabel.snp.makeConstraints {
            $0.top.equalTo(jinryobi.snp.top)
            $0.right.equalToSuperview().inset(20)
        }
        
        addSubview(jinryoDesc)
        jinryoDesc.snp.makeConstraints {
            $0.top.equalTo(jinryobi.snp.bottom).offset(8)
            $0.left.equalTo(jinryobi.snp.left)
        }
        
        addSubview(divider)
        divider.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.top.equalTo(jinryoDesc.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        addSubview(name)
        name.snp.makeConstraints {
            $0.left.equalTo(jinryoDesc.snp.left)
            $0.top.equalTo(divider.snp.bottom).offset(16)
        }
        
        addSubview(nameRight)
        nameRight.snp.makeConstraints {
            $0.centerY.equalTo(name.snp.centerY)
            $0.right.equalTo(amountLabel.snp.right)
        }
        
        addSubview(phone)
        phone.snp.makeConstraints {
            $0.left.equalTo(name.snp.left)
            $0.top.equalTo(name.snp.bottom).offset(8)
        }
        
        addSubview(phoneRight)
        phoneRight.snp.makeConstraints {
            $0.centerY.equalTo(phone.snp.centerY)
            $0.right.equalTo(amountLabel.snp.right)
        }
        
        addSubview(jinryobiLabel)
        jinryobiLabel.snp.makeConstraints {
            $0.left.equalTo(phone.snp.left)
            $0.top.equalTo(phone.snp.bottom).offset(8)
        }
        
        addSubview(jinryobiRight)
        jinryobiRight.snp.makeConstraints {
            $0.centerY.equalTo(jinryobiLabel.snp.centerY)
            $0.right.equalTo(amountLabel.snp.right)
        }
        
        addSubview(service)
        service.snp.makeConstraints {
            $0.left.equalTo(jinryobiLabel.snp.left)
            $0.top.equalTo(jinryobiLabel.snp.bottom).offset(8)
        }
        
        addSubview(serviceRight)
        serviceRight.snp.makeConstraints {
            $0.centerY.equalTo(service.snp.centerY)
            $0.right.equalTo(amountLabel.snp.right)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

#if DEBUG
import SwiftUI

struct HeaderView_Preivews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .getRepresentable()
            .frame(maxWidth: 350)
            .frame(height: 274)
    }
}

#endif


