//
//  MyPageTableHeader.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/23.
//

import Foundation
import UIKit

class MyPageTableHeader: UITableViewHeaderFooterView {
    static let identifier = "TableHeader"
    
    private lazy var helloLabel = UILabel().then {
        $0.attributedText = attributedStateText(label1: "홍길동", label2: "님, 안녕하세요")
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    
    private let myButton = UIButton(type: .system).then {
        $0.backgroundColor = .white
        $0.setTitleColor(UIColor(rgb: 0x808080), for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 14)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(rgb: 0xE6E6E6).cgColor
        $0.layer.cornerRadius = 8
        $0.setTitle("내 정보 관리", for: .normal)
    }
    
    private let hStack = UIStackView().then {
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = -20
        $0.layer.cornerRadius = 16
        $0.layer.backgroundColor = UIColor.white.cgColor
        $0.addArrangedSubview(MyPageHeaderCell(imageNamed: "icn_heart", textLabel: "기본 건강 정보"))
        $0.addArrangedSubview(MyPageHeaderCell(imageNamed: "icn_card", textLabel: "결제수단"))
        $0.addArrangedSubview(MyPageHeaderCell(imageNamed: "icn_adress", textLabel: "주소관리"))
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(helloLabel)
        contentView.addSubview(myButton)
        contentView.addSubview(hStack)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        helloLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(20)
        }
        
        myButton.snp.makeConstraints {
            $0.centerY.equalTo(helloLabel)
            $0.right.equalToSuperview().inset(20)
            $0.width.equalTo(86)
            $0.height.equalTo(31)
        }
        
        hStack.snp.makeConstraints {
            $0.top.equalTo(helloLabel.snp.bottom).offset(16)
            $0.width.equalToSuperview()
            $0.height.equalTo(117)
        }
    }
    
    func attributedStateText(label1: String, label2: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: label1, attributes: [.font: UIFont(name: "Pretendard-Bold", size: 22)])
        attributedText.append(NSAttributedString(string: label2, attributes: [.font: UIFont(name: "Pretendard", size: 22), .foregroundColor: UIColor.lightGray]))
        
        return attributedText
    }
    
}


