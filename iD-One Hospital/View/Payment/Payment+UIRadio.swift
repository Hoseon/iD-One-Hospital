//
//  Payment+UIRadio.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/12/08.
//

import Foundation
import UIKit
import Then
import SnapKit

class PaymentUIRadio: UIView, RadioButtonDelegate {
    
    private let radioOn = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "radio_checked")
    }
    
    private let radioOff = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "radio_unchecked")
    }
    
    private let radioOff2 = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "radio_unchecked")
    }
    
    private let useLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "Pretendard-Bold", size: 22)
        $0.text = "결제수단"
    }
    
    private let spec1Label = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
        $0.textColor = UIColor(rgb: 0x808080)
        $0.text = "국내 신용/체크카드"
    }
    
    private let spec2Label = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
        $0.textColor = UIColor(rgb: 0x808080)
        $0.text = "무통장 입금"
    }
    
    private let spec3Label = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
        $0.textColor = UIColor(rgb: 0x808080)
        $0.text = "실시간 계좌이체"
    }
    
    private let cardUIView = UIView().then {
        $0.layer.cornerRadius = 15
        $0.layer.borderColor = UIColor(rgb: 0x36BFFA).cgColor
        $0.layer.borderWidth = 2
    }
    
    private let cardSS = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "card_ss")
    }
    
    private let personUIView = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 12
        $0.layer.borderColor = UIColor(rgb: 0x4872DF).cgColor
        $0.backgroundColor = UIColor(rgb: 0xABBAF8)
    }
    
    private let personLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.textColor = UIColor(rgb: 0x4872DF)
        $0.text = "개인"
    }
    
    private let cardNumber = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Regular", size: 16)
        $0.textColor = UIColor(rgb: 0xB3B3B3)
        $0.text = "4000 - 12** - **** - ****"
    }
    
    private let forwardImage = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "icn_arrow_forward")
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubview(useLabel)
        useLabel.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(20)
        }
        
        addSubview(radioOn)
        radioOn.snp.makeConstraints {
            $0.left.equalTo(useLabel.snp.left)
            $0.top.equalTo(useLabel.snp.bottom).offset(16)
        }
        
        addSubview(spec1Label)
        spec1Label.snp.makeConstraints {
            $0.centerY.equalTo(radioOn.snp.centerY)
            $0.left.equalTo(radioOn.snp.right).offset(10)
        }
        
        addSubview(cardUIView)
        cardUIView.snp.makeConstraints {
            $0.top.equalTo(spec1Label.snp.bottom).offset(8)
            $0.height.equalTo(82)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        cardUIView.addSubview(cardSS)
        cardSS.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(16)
        }
        
        personUIView.addSubview(personLabel)
        personLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        cardUIView.addSubview(personUIView)
        personUIView.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.height.equalTo(22)
            $0.centerY.equalTo(cardSS.snp.centerY)
            $0.left.equalTo(cardSS.snp.right).offset(10)
        }
        
        cardUIView.addSubview(cardNumber)
        cardNumber.snp.makeConstraints {
            $0.top.equalTo(cardSS.snp.bottom).offset(4)
            $0.left.equalTo(cardSS.snp.left)
        }
        
        cardUIView.addSubview(forwardImage)
        forwardImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(16)
        }
        
        addSubview(radioOff)
        radioOff.snp.makeConstraints {
            $0.top.equalTo(cardUIView.snp.bottom).offset(10)
            $0.left.equalTo(cardUIView.snp.left)
        }
        
        addSubview(spec2Label)
        spec2Label.snp.makeConstraints {
            $0.centerY.equalTo(radioOff.snp.centerY)
            $0.left.equalTo(radioOff.snp.right).offset(10)
        }
        
        addSubview(radioOff2)
        radioOff2.snp.makeConstraints {
            $0.top.equalTo(radioOff.snp.bottom).offset(10)
            $0.left.equalTo(cardUIView.snp.left)
        }
        
        addSubview(spec3Label)
        spec3Label.snp.makeConstraints {
            $0.centerY.equalTo(radioOff2.snp.centerY)
            $0.left.equalTo(radioOff.snp.right).offset(10)
        }
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func onClick(_ sender: UIView) {
        guard let currentRadioButton = sender as? RadioButton else {
            return          }

    }
    
    
}

#if DEBUG
import SwiftUI

struct PaymentUIRadio_Preivews: PreviewProvider {
    static var previews: some View {
        PaymentUIRadio()
            .getRepresentable()
            .frame(maxWidth: 350)
            .frame(height: 274)
    }
}

#endif


