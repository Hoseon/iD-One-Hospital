//
//  LoginController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/10.
//

import Foundation
import UIKit
import SnapKit

class LoginController: UIViewController, ConstraintRelatableTarget {
    // MARK: - properties
    //스크롤뷰 감싸기
    
    public static let shared: LoginController = LoginController()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
        label.numberOfLines = 0
        label.textColor = .black
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let containerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.isScrollEnabled = true
        $0.backgroundColor = .white
    }
    
    //로고
    private let logoImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "logo"))
        return iv
    }()
    
    private let emailLabel = UILabel().then {
        $0.textColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        $0.attributedText = "이메일".styled(with: bold16Style)
    }
    
    private let emailTextField = CustomTextField(placeholder: "이메일 주소를 입력해주세요.").then {
        $0.keyboardType = .emailAddress
    }
    
    private let passwordLabel = UILabel().then {
        $0.textColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
        $0.attributedText = "패스워드".styled(with: bold16Style)
    }
    
    private let passwordTextField = CustomTextField(placeholder: "비밀번호를 입력해주세요").then {
        $0.enablesReturnKeyAutomatically = true
        $0.returnKeyType = .send
        $0.isSecureTextEntry = true
    }
    
    //로고 밑 라벨
    private let logoLabel: UILabel = {
        let ul = UILabel()
        ul.text = "내 손안의 주치의"
        let otherText = "주치의"
        let ulFont = UIFont(name: "Pretendard-Bold", size: 28)
        ul.font = .systemFont(ofSize: 28)
        ul.textColor = .black
        ul.asFontColor(targetStringList: [otherText], font: ulFont, color: UIColor(rgb: 0x36BFFA))
        
        return ul
    }()
    
    private let loginButton = UIButton(type: .system).then {
        $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 20)
        $0.isEnabled = true
        $0.addTarget(self, action: #selector(pushToLogin), for: .touchUpInside)
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = UIColor(red: 0.212, green: 0.75, blue: 0.98, alpha: 1)
        $0.layer.cornerRadius = 12
        $0.setTitleColor(.white, for: .normal)
        
    }
    
    private let findButton = UIButton(type: .system).then {
        $0.setTitleColor(UIColor(rgb: 0x5C5C5C), for: .normal)
        $0.setAttributedTitle("아이디 / 비밀번호찾기".styled(with: regular14Style), for: .normal)
    }
    
    private let registerButton = UIButton(type: .system).then {
        $0.setTitleColor(UIColor(rgb: 0x5C5C5C), for: .normal)
        $0.setAttributedTitle("회원가입".styled(with: regular14Style), for: .normal)
    }
    
    
    // MARK: - 라이프싸이클 영역
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        navigationController?.setNavigationBarHidden(true, animated: animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //        navigationController?.setNavigationBarHidden(false, animated: animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        overrideUserInterfaceStyle = .light
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(myTapMethod))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(singleTapGestureRecognizer)
        setupScroll()
        configureUI()
    }
    
    // MARK: - Helpers
    @objc func myTapMethod(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func setupScroll() {
        view.addSubview(scrollView)
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .default
        scrollView.addSubview(containerView)
        scrollView.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalTo(view.snp.width)
            $0.height.equalToSuperview()
            $0.top.equalTo(view.snp.top)
            $0.bottom.equalTo(view.snp.bottom)
        }
        
        containerView.snp.makeConstraints {
            $0.centerX.equalTo(scrollView.snp.centerX)
            $0.width.equalTo(scrollView.snp.width)
            $0.height.equalToSuperview()
            $0.top.equalTo(scrollView.snp.top)
            $0.bottom.equalTo(scrollView.snp.bottom)
        }
    }
    
    func configureUI() {
        //        view.backgroundColor = .white
        //        navigationController?.navigationBar.isHidden = true
        //        navigationController?.navigationBar.barStyle = .black
        
        containerView.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(116.5)
        }
        
        containerView.addSubview(logoLabel)
        logoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(20)
        }
        
        
        containerView.addSubview(emailTextField)
        emailTextField.snp.makeConstraints {
            $0.width.equalTo(self.view.frame.size.width)
            $0.top.equalTo(logoLabel.snp.bottom).offset(80)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        containerView.addSubview(emailLabel)
        emailLabel.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(24)
            $0.bottom.equalTo(emailTextField.snp.top).offset(-4)
            $0.left.equalTo(emailTextField)
        }
        
        containerView.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(16)
            $0.leading.equalTo(emailTextField)
        }
        
        containerView.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints{
            $0.width.equalTo(emailTextField.snp.width)
            $0.top.equalTo(passwordLabel.snp.bottom).offset(4)
            $0.leading.equalTo(emailTextField)
        }
        
        containerView.addSubview(loginButton)
        loginButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(passwordTextField)
            $0.width.equalTo(passwordTextField.snp.width)
            $0.centerX.equalTo(containerView.snp.centerX)
            $0.top.equalTo(emailTextField.snp.bottom).offset(140)
            //            $0.bottom.equalToSuperview().offset(-80)
            $0.height.equalTo(54)
        }
        
        let separator = UIView()
        separator.backgroundColor = .gray
        separator.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        
        let bottomStackView = UIStackView(arrangedSubviews: [findButton, separator, registerButton])
        
        bottomStackView.spacing = 10
        bottomStackView.distribution = .fillProportionally
        
        containerView.addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(20)
            //            $0.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom).inset(50)
        }
        
    }
    
    // MARK: - Actions
    
    @objc func pushToLogin() {
        showPopUpTwoButton(title: "결제", message: "로그인을 위해서 iD•One\n인증을 진행하시겠습니까?", rightActionCompletion: confirm)
    }
    
    func confirm() {
        print(#fileID, #function, #line, "-확인 버튼 누름")
        let url = "metaDNA://https://devapi.metadna.kr/api/qr/scan/HOSPITAL"
        if let openApp = URL(string: url), UIApplication.shared.canOpenURL(openApp) {
            UIApplication.shared.openURL(openApp)
        } else {
            print(#fileID, #function, #line, "-앱을 열지 못함")
        }
    }
    
    func pushToHomeDeeplink() {
            print("test")
            self.navigationController?.pushViewController(MainTabController(), animated: true)
            print("test22")
        
    }
    
    
    @objc func pushToHome() {
//        self.navigationController?.pushViewController(MainTabController(), animated: true)
        let url = "metaDNA://"
        if let openApp = URL(string: url), UIApplication.shared.canOpenURL(openApp) {
            UIApplication.shared.openURL(openApp)
        } else {
            print(#fileID, #function, #line, "-앱을 열지 못함")
        }
    }
    
    
    @objc func keyboardUp(notification:NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            
            UIView.animate(withDuration: 0.3) {
                self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardRectangle.height+100)
            }
        }
    }
    
    @objc func keyboardDown() {
        self.view.transform = .identity
        self.view.endEditing(true)
    }
    
}

extension LoginController: UITextViewDelegate {
    
}
#if DEBUG
import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        LoginController()
    }
}

struct ViewControllerPrepresentable_PreviewProvider : PreviewProvider {
    static var previews: some View {
        ViewControllerPresentable()
            .previewDisplayName("iPhone 14 Pro")
    }
}
#endif
