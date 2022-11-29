//
//  MyPageHeaderCell.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/24.
//

import Foundation
import UIKit
import SnapKit
import Then

class MyPageHeaderCell: UIView {
    
    private let icn_heart = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "icn_heart")
    }
    
    private let text = UILabel().then {
        $0.attributedText = "기본 건강 정보".styled(with: regular14Style)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        let cardStack = UIStackView()
//        cardStack.axis = .horizontal
////        cardStack.distribution = .fillEqually
//        cardStack.layer.backgroundColor = UIColor.white.cgColor
//        cardStack.layer.cornerRadius = 16
//
        
        let hStack = UIStackView()
        hStack.axis = .vertical
        hStack.spacing = 8
        hStack.alignment = .center
        hStack.addArrangedSubview(icn_heart)
        hStack.addArrangedSubview(text)
        addSubview(hStack)
        hStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(imageNamed: String,
                     textLabel: String)
    {
        self.init()
        self.icn_heart.image = UIImage(named: imageNamed)
        self.text.text = textLabel
    }
    
}

#if DEBUG
import SwiftUI
struct MyPageHeaderCell_Preivews: PreviewProvider {
    static var previews: some View {
        MyPageHeaderCell()
            .getRepresentable()
            .frame(maxWidth: 90)
            .frame(height: 69)
    }
}
#endif


