//
//  TestController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/22.
//

import Foundation
import UIKit
import SnapKit

class TableHeader: UITableViewHeaderFooterView {
    static let identifier = "TableHeader"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "doctor")
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Select Tesla"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        imageView.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }
//        label.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
    }
}

class TableFooter: UITableViewHeaderFooterView {
    
}

class TestController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    private let tableView: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 300), style: .insetGrouped)
        table.separatorStyle = .none
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        return table
    }()
    
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
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "doctor")
        return imageView
    }()
    
    private let icnCamera: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "icn_camera")
        
        return imageView
    }()
    
    private let slideLabel = UILabel().then {
        $0.textColor = .blue
        $0.numberOfLines = 2
        $0.attributedText = "스마트 문진으로\n더욱 정확한 진료 보기".styled(with: bold18height26Style)
        
    }
    
    private let slideSubLabel = UILabel().then {
        $0.numberOfLines = 1
        $0.attributedText = "어디아파 비대면 진료 사용법을 알아보세요".styled(with: regular14grayStyle)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        view.backgroundColor = .red
        // Make the navigation bar's title with red text.
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        self.navigationItem.title = "앱 이용을 위한 권한 안내"
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:UIFont(name: "Pretendard-Bold", size: 24)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
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
