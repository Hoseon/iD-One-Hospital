//
//  CustomTextField.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/17.
//

import UIKit
import SnapKit
import Then
import BonMot

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let spacer = UIView().then {
            $0.frame = CGRect(x: 0, y: 0, width: 12, height: 12)
        }

        layer.borderColor = UIColor(rgb: 0xB3B3B3).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 12
        leftView = spacer
        leftViewMode = .always
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        keyboardAppearance = .dark
        textColor = .black
//        borderStyle = .roundedRect
        self.snp.makeConstraints {
            $0.height.equalTo(50)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String) {
        self.init()
        print(#fileID, #function, #line, "-")
        attributedPlaceholder = placeholder.styled(with: placeHolder14Style)

        
        
    }
}
