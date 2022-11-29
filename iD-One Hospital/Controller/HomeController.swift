//
//  HomeController.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/10.
//

import Foundation
import UIKit
import Then
import SnapKit

class HomeController: UIViewController {
    // MARK: - Properties
    
    private var carouselView: CarouselView?
    private var carouselData = [CarouselView.CarouselData]()
    
    private let homeLogo = UIImageView(image: UIImage(named: "home_logo")).then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let actionBtn1 = UIButton(type: .system).then {
        $0.contentMode = .scaleAspectFit
        $0.addTarget(HomeController.self, action: #selector(handleLogout), for: .touchUpInside)
        $0.setImage(UIImage(named: "appbar_action1"), for: .normal)
        
    }
    
    private let actionBtn2 = UIButton(type: .system).then {
        $0.contentMode = .scaleAspectFit
        $0.addTarget(HomeController.self, action: #selector(handleLogout), for: .touchUpInside)
        $0.setImage(UIImage(named: "appbar_action2"), for: .normal)
        
    }
    
    private let startButton = UIButton(type: .system).then {
        $0.addTarget(self, action: #selector(pushToClassRoom), for: .touchUpInside)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 20)
        $0.isEnabled = true
        $0.setTitle("당일 진료 받기", for: .normal)
        $0.backgroundColor = UIColor(red: 0.212, green: 0.75, blue: 0.98, alpha: 1)
        $0.layer.cornerRadius = 12
        $0.setTitleColor(.white, for: .normal)
    }
    
    private let homeLabel: UILabel = {
        let ul = UILabel()
        ul.numberOfLines = 0
        ul.text = "지금 바로\n비대면 진료 하세요!"
        let otherText = "비대면 진료"
        let ulFont = UIFont(name: "Pretendard-Bold", size: 34)
        ul.font = UIFont(name: "Pretendard-Regular", size: 34)
        ul.textColor = .black
        ul.textAlignment = .left
        ul.asFontColor(targetStringList: [otherText], font: ulFont, color: UIColor(rgb: 0x36BFFA))
        return ul
    }()
    
    private let sublabel = UILabel().then {
        $0.attributedText = "언제 어디서나 간편하고 빠르게".styled(with: regular22Style)
    }
    
    private let doctorImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "home_doctor")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.backgroundColor = .white
        view.backgroundColor = .white
        configureUI()
        
        carouselView = CarouselView(pages: 4, delegate: self)
        carouselData.append(.init(image: UIImage(named: "home_doctor"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
        carouselData.append(.init(image: UIImage(named: "home_doctor"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
        carouselData.append(.init(image: UIImage(named: "home_doctor"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
        carouselData.append(.init(image: UIImage(named: "home_doctor"), text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        carouselView?.configureView(with: carouselData)
    }
    
    
    
    // MARK: - Helpers
    func configureUI() {
        
        
        view.addSubview(homeLogo)
        
        homeLogo.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(17)
            $0.left.equalToSuperview().offset(20)
        }
        
        view.addSubview(actionBtn2)
        actionBtn2.snp.makeConstraints {
            $0.centerY.equalTo(homeLogo)
            $0.right.equalToSuperview().inset(20)
        }

        view.addSubview(actionBtn1)
        actionBtn1.snp.makeConstraints {
            $0.centerY.equalTo(actionBtn2)
            $0.right.equalTo(actionBtn2.snp.left).offset(1)
        }
        
        view.addSubview(homeLabel)
        homeLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(91)
            $0.left.right.equalToSuperview().offset(49)
            $0.width.equalToSuperview()
        }
        
        view.addSubview(sublabel)
        sublabel.snp.makeConstraints {
            $0.top.equalTo(homeLabel.snp.bottom).offset(10)
            $0.left.right.equalTo(homeLabel)
            $0.width.equalToSuperview()
            $0.height.equalTo(40)
        }
        
    
        view.addSubview(doctorImage)
        doctorImage.snp.makeConstraints {
            $0.top.equalTo(sublabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            
            if UIDevice.current.isiPhoneSE {
                $0.width.equalTo(130)
                $0.height.equalTo(130)
            } else {
                
                
            }
        }
        
    }
    
    func setupUI() {
        guard let carouselView = carouselView else { return }
        view.addSubview(carouselView)
        
        self.view.bringSubviewToFront(carouselView)
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        carouselView.topAnchor.constraint(equalTo: doctorImage.bottomAnchor, constant: -22).isActive = true
        carouselView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        carouselView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        carouselView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(startButton)
        view.bringSubviewToFront(startButton)
        startButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-120)
            $0.left.right.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(63)
            
        }
    }
    
    
    // MARK: - Actions
    @objc func handleLogout() {
        print("test")
    }
    
    @objc func pushToClassRoom() {
        let selectClassController = SelectClassController()
        
        self.navigationController?.pushViewController(selectClassController, animated: true)
    }
}

// MARK: - CarouselViewDelegate
extension HomeController: CarouselViewDelegate {
    func currentPageDidChange(to page: Int) {
    }
}

