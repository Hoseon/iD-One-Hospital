//
//  MyPageController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/10.
//

import Foundation
import UIKit
import Then
import SnapKit
import BonMot

class MyPageController: UIViewController {
    
    private let mdoels = [
        "1:1 문의",
        "공지사항",
        "FAQ",
        "이용약관",
        "개인정보 처리방침",
        "환경설정",
    ]
    
    private let mdoelIcons = [
        "icn_inquiry_active",
        "icn+notice",
        "icn_faq",
        "icn_terms",
        "icn_privacy",
        "icn_set",
    ]
    
    // MARK: - Properties
    private let tableView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 300), style: .insetGrouped)
        table.separatorStyle = .none
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(MyPageTableHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        return table
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "doctor")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
    
        configureAppbar()
        view.addSubview(tableView)
//        tableView.snp.makeConstraints {
//            $0.left.right.equalToSuperview().offset(50)
//        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    func configureAppbar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "uiwhite")
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        navigationItem.title = "마이 페이지"
        appearance.shadowColor = UIColor.black
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor(named: "uiblack"), NSAttributedString.Key.font:UIFont(name: "Pretendard-Bold", size: 24)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
    }
    
}

extension MyPageController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mdoels.count
    }
    
    //한셀당 높이 조절
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = mdoels[indexPath.row]
        cell.layer.backgroundColor = UIColor.red.cgColor
        cell.imageView?.image = UIImage(named: mdoelIcons[indexPath.row])

        return cell
    }
    
    //헤더 영역
    //헤더 클래스에서 가져 온다.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        return header
    }
    
    //헤더 높이 지정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
}
    
#if DEBUG

import SwiftUI

struct MyPageControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        MyPageController()
    }
}
struct MyPageControllerPrepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        MyPageControllerPresentable()
            .previewDevice("iPhone 12 mini")
            .previewDisplayName("iPhone 12 mini")
            .ignoresSafeArea()
    }
}

#endif


