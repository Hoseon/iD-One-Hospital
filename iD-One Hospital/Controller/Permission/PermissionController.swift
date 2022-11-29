//
//  PermissionController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/15.
//

import Foundation
import UIKit
import SnapKit
import Then

class PermissionController: UIViewController {
    // MARK: - Properties
    var statusBarStyle: UIStatusBarStyle = .lightContent
    
    private let headTitle = UILabel().then {
        $0.attributedText = "필수 접근 권한".styled(with: bold22Style)
        $0.textColor = .red
    }
    
    private let textLayerview = UIView().then {
        
        $0.layer.cornerRadius = 10
        $0.layer.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.976, alpha: 1).cgColor
    }
    
    private let viewDesc = UILabel().then {
        $0.numberOfLines = 0
        $0.textColor = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1)
        $0.attributedText = "• 선택적 접근 권한은 관련 기능 이용(접근) 시 동의 하실 수 있으며, 미동의에도 해당 기능 외 앱 서비스는 이용 가능합니다.\n \n• 휴대폰 ‘설정' > 애플리케이션 관리 > 어디아파 > 앱 권한에서도 설정 변경 하실 수 있습니다.".styled(with: regular14Style)
        $0.textAlignment = .left
    }
    
    private let confirmButton = UIButton(type: .system).then {
        $0.addTarget(self, action: #selector(pushToPermission), for: .touchUpInside)
        $0.setTitle("확인", for: .normal)
        $0.backgroundColor = UIColor(red: 0.212, green: 0.75, blue: 0.98, alpha: 1)
        $0.layer.cornerRadius = 12
        $0.setTitleColor(.white, for: .normal)
        
        $0.titleLabel?.attributedText = "확인".styled(with: bold20Style)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        configureNavi()
        configureUI()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    // MARK: - Helpers
    
    func templateHeader(headerImage: UIImage, title: String, subTitle: String) -> UIStackView {
        
        
        
        let uv = UIImageView(image: headerImage.resize(newWidth: 34)).then {
            $0.contentMode = .scaleAspectFit
        }
        
        
        
        let titleLabel = UILabel().then {
            $0.text = title
            $0.font = UIFont(name: "Pretendard-Bold", size: 18)
            
        }
        
        let subTitleLabel = UILabel().then {
            $0.text = subTitle
            $0.font = UIFont(name: "Pretendard-Regular", size: 16)
            $0.textColor = UIColor(red: 0.502, green: 0.502, blue: 0.502, alpha: 1)
        }
        
        let vStackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        vStackView.axis = .vertical
        vStackView.spacing = 4
        
        let hstackView = UIStackView(arrangedSubviews: [uv, vStackView])
        hstackView.axis = .horizontal
        hstackView.spacing = 17
        
        return hstackView
    }
    
    func configureNavi() {
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "앱 이용을 위한 권한 안내"
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:UIFont(name: "Pretendard-Bold", size: 24)]
        self.navigationController?.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
//                        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(tapForGear))
    }
    
    func configureUI(){
        view.backgroundColor = .white
        
        view.addSubview(headTitle)
        headTitle.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            $0.left.equalToSuperview().offset(20)
        }
        
        let camera = templateHeader(headerImage: UIImage(named: "icn_camera")!, title: "카메라", subTitle: "비대면 진료 영상 인식")
        
        let photo = templateHeader(headerImage: UIImage(named: "icn_loccation_allowed_gallery")!, title: "사진/미디어/파일", subTitle: "이미지 캐시, 파일 읽기 또는 저장")
        
        let mic = templateHeader(headerImage: UIImage(named: "icn_mic")!, title: "마이크", subTitle: "비대면 진료 음성 인식")
        
        let gps = templateHeader(headerImage: UIImage(named: "icn_location")!, title: "위치", subTitle: "비대면 진료를 위한 현재 위치 파악")
        
        
        
        let stackView = UIStackView(arrangedSubviews: [ camera, photo, mic, gps])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 27
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(headTitle.snp.bottom).offset(40)
            $0.left.equalToSuperview().offset(29)
        }
        
        textLayerview.addSubview(viewDesc)
        view.addSubview(textLayerview)
        
        
        textLayerview.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
//            $0.width.equalToSuperview()
            $0.height.equalTo(129)
            
            $0.top.equalTo(stackView.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
        }
        
        viewDesc.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(textLayerview.snp.top).offset(12)
        }
        
        view.addSubview(confirmButton)
        
        confirmButton.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.centerX.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
            
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(10)
        }
        
        
        
    }
    
    // MARK: - Actions
    
    @objc func pushToPermission() {
//        let controller = PermissionController()
//        let nav = UINavigationController(rootViewController: controller)
//        nav.modalPresentationStyle = .fullScreen
//        self.present(nav, animated: false, completion: nil)
        DispatchQueue.main.async {
            let onboardVC = OnboardViewController()
            let nav = UINavigationController(rootViewController: onboardVC)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true)
        }
        
        
    }
}

extension UIImage {
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        
        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        
        print("화면 배율: \(UIScreen.main.scale)")// 배수
        print("origin: \(self), resize: \(renderImage)")
        //        printDataSize(renderImage)
        return renderImage
    }
}


#if DEBUG

import SwiftUI

struct PermissionControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        PermissionController()
    }
}

struct PermissionControllerPrepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        PermissionControllerPresentable()
            .previewDevice("iPhone 14 Pro")
            .previewDisplayName("iPhone 14 Pro")
            .ignoresSafeArea()
    }
}

#endif

