//
//  Select2ViewController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/28.
//

import Foundation
import UIKit
import Then
import SnapKit

class Select2ViewController: UIViewController {
    
    private let emptyImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "nodoctor")
    }
    
    private let emptyTitle = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = UIFont(name: "Pretendard-Regular", size: 18)
        $0.textColor = UIColor(red: 0.702, green: 0.702, blue: 0.702, alpha: 1)
        $0.text = "선택하신 진료과에는\n현재 진료 가능한 의사를 찾을 수 없습니다."
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(emptyImage)
        emptyImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        view.addSubview(emptyTitle)
        emptyTitle.snp.makeConstraints {
            $0.top.equalTo(emptyImage.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
    }
}
