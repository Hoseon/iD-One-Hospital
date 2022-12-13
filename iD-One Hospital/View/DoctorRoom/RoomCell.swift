//
//  RoomCell.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/25.
//

import Foundation
import UIKit
import Then
import SnapKit

protocol RoombuttonDelegate {
    func didTapButton()
}

class RoomCell: UIView {
    
    var onClicked: (() -> Void)? = nil
    
    var delegate: RoombuttonDelegate?
    
    private var testView = UIView().then {
        $0.layer.borderColor = UIColor(rgb: 0xE9E9E9).cgColor
        $0.layer.borderWidth = 1.07
        $0.layer.cornerRadius = 16
        $0.backgroundColor = .white
    }
    
    private var classBtn = UIButton(type: .system).then {
        $0.addTarget(self, action: #selector(onButtonClicked(_:)), for: .touchUpInside)
        $0.setImage(UIImage(named: ""), for: .normal)
        $0.setTitle("", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.alignTextBelow(spacing: 8)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        testView.addSubview(classBtn)
        classBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        addSubview(testView)
        testView.snp.makeConstraints {
            $0.width.equalTo(106)
            $0.height.equalTo(102)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(iconName: String,
                     btnText: String) {
        self.init()
        classBtn.setImage(UIImage(named: iconName), for: .normal)
        classBtn.setTitle(btnText, for: .normal)
        classBtn.alignTextBelow(spacing: 8)
        testView.addSubview(classBtn)
        classBtn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        addSubview(testView)
        testView.snp.makeConstraints {
            $0.width.equalTo(106)
            $0.height.equalTo(102)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
    }
    
    @objc func onButtonClicked(_ sender: UIButton) {
        //delegate패턴을 잡으곳으로 return
        delegate?.didTapButton()
        
    }
    
}

#if DEBUG
import SwiftUI

struct RoomCell_Preivews: PreviewProvider {
    static var previews: some View {
        RoomCell()
            .getRepresentable()
            .frame(maxWidth: 350)
            .frame(height: 274)
    }
}

#endif

