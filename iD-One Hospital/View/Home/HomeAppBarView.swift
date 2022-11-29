//
//  HomeAppBar.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/21.
//

import UIKit
import Then
import SnapKit

class HomeAppBarView: UIView {
    // MARK: - Properties
    private let uview = UIView().then {
        $0.backgroundColor = .red
    }
    
    private let logoimage = UIImageView(image: UIImage(named: "home_logo")).then {
        $0.backgroundColor = .red
    }
    
    let appbarAction1 = UIButton(type: .system).then {
        $0.tintColor = UIColor(white: 0, alpha: 0.2)
        $0.setImage(UIImage(named: "appbar_action1"), for: .normal)
    }
    
    let appbarAction2 = UIButton(type: .system).then {
        $0.tintColor = UIColor(white: 0, alpha: 0.2)
        $0.setImage(UIImage(named: "appbar_action2"), for: .normal)
    }
    
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func configureUI() {

        
    // MARK: - Actions
        
    }
}
