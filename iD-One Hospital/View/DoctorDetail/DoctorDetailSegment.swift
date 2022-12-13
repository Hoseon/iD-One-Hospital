//
//  DoctorDetailSegment.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/12/08.
//

import Foundation
import UIKit
import DTPagerController

class DoctorDetailSegment: DTPagerController {
    init() {
        super.init(viewControllers: [])
        title = "비대면 진료실"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSegment()
        
        view.isUserInteractionEnabled = true
    
    }
    
    func configureSegment() {
        perferredScrollIndicatorHeight = 2
        
        let viewController1 = DoctorDetail1()
        viewController1.title = "의사 정보"
        
        let viewController2 = DoctorDetail2()
        viewController2.title = "병원 정보"
        
        viewControllers = [viewController1, viewController2]
        
        scrollIndicator.backgroundColor = UIColor(rgb: 0x4AC6FF)
        scrollIndicator.tintColor = .white
        scrollIndicator.layer.cornerRadius = scrollIndicator.frame.height / 2
        
        setSelectedPageIndex(0, animated: true)
        pageSegmentedControl.setTitleTextAttributes([.font: UIFont(name: "Pretendard-Bold", size: 18), .foregroundColor: UIColor(rgb: 0x4AC6FF)], for: .selected)
        pageSegmentedControl.backgroundColor = .clear
        pageSegmentedControl.accessibilityIgnoresInvertColors = true
        pageSegmentedControl.layer.masksToBounds = false
        pageSegmentedControl.layer.shadowColor = UIColor(rgb: 0xE6E6E6).cgColor //언더라인색상
        pageSegmentedControl.layer.shadowOffset = CGSize(width: 0, height: 1) //언더라인두께
    }
}
