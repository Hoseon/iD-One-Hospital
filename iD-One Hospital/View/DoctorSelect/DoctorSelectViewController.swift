//
//  DoctorSelectViewController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/28.
//

import Foundation
import UIKit
import DTPagerController

class DoctorSelectViewController: DTPagerController {
    init() {
        super.init(viewControllers: [])
        title = "비대면 진료실"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configureSegment()
        
    }
    
    // MARK: - Helpers
    func configureNavi() {
        self.view.backgroundColor = .white
        self.navigationController?.setToolbarHidden(false, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white ]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backbutton"), style: .plain, target: self, action: #selector(backbutton))
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor.white
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
    }
    
    func configureSegment() {
        perferredScrollIndicatorHeight = 2

        let viewController1 = Select1ViewController()
        viewController1.title = "가정의학과"

        let viewController2 = Select2ViewController()
        viewController2.title = "비뇨기과"

        let viewController3 = Select3ViewController()
        viewController3.title = "이비인후과"
        
        let viewController4 = Select4ViewController()
        viewController4.title = "피부과"

        viewControllers = [viewController1, viewController2, viewController3, viewController4]
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
    
    @objc func backbutton() {
        print(#fileID, #function, #line, "-")
        self.navigationController?.popViewController(animated: true)
    }
}

extension UIColor {
    static var appDefault: UIColor {
        return UIColor(red: 0.2, green: 0.4, blue: 1, alpha: 1)
    }
}

//2022-12-28 세그먼트가 하얀색으로 변형이 되지 않아. 세그먼트컨트롤러가 생성되는 시점에 반복으로 돌아 하얀색으로 처리
extension DTSegmentedControl {
    open override func layoutSubviews() {
        super.layoutSubviews()
        for i in 0...subviews.count - 1 {
            subviews[i].backgroundColor = .white
        }
    }
}

#if DEBUG
import SwiftUI

struct DoctorSelectViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        DoctorSelectViewController()
    }
}

struct DoctorSelectViewController_PreviewProvider : PreviewProvider {
    static var previews: some View {
        DoctorSelectViewControllerPresentable()
            .previewDisplayName("iPhone 14 Pro")
    }
}
#endif




