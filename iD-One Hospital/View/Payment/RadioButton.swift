//
//  RadioButton.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/12/08.
//

import Foundation
import UIKit
import SnapKit

protocol RadioButtonDelegate {
    func onClick(_ sender: UIView)
}

class RadioButton: UIButton {
    var checkedView: UIView?
    var uncheckedView: UIView?
    var delegate: RadioButtonDelegate?
    
    var isChecked: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        checkedView?.removeFromSuperview()
        uncheckedView?.removeFromSuperview()
        removeConstraints(self.constraints)
        
        let view = isChecked == true ? checkedView : uncheckedView
        if let view = view {
            addSubview(view)
            view.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.centerY.equalToSuperview()
            }
        }
    }
    
    @objc func onClick(sender: UIButton) {
            if sender == self {
                delegate?.onClick(self)
            }
        }
    
}
