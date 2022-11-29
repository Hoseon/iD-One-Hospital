//
//  OnboardView1.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/16.
//

import Foundation
import UIKit
import SnapKit
import Then
import BonMot

class OnboardView2: UIView {
    // MARK: - Properties
    private let image1 = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "Img_Onboarding_02")
    }
    
    private let headTitle = UILabel().then {
//        $0.textAlignment = .center
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        $0.attributedText = "급할 땐 언제든\n마음 놓고 진료보세요".styled(with: bold32Style)
        $0.textColor = .black
        
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
        print(#fileID, #function, #line, "-")
        self.addSubview(headTitle)
        
        headTitle.snp.makeConstraints {
            $0.left.equalToSuperview().offset(63)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(264)
            $0.height.equalTo(88)
        }
        
        self.addSubview(image1)
        
        image1.snp.makeConstraints {
            $0.top.equalTo(headTitle.snp.bottom).offset(54)
            $0.width.equalToSuperview()
            $0.height.equalTo(341)
        }
    }
    
    // MARK: - Actions
}

#if DEBUG

import SwiftUI

struct OnboardView2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView2()
            .getRepresentable()
            .frame(maxWidth: .infinity)
            .frame(minHeight: 300)
    }
}

#endif

