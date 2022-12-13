//
//  DoctorDetailView.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/12/08.
//

import Foundation
import UIKit
import Then
import SnapKit

class DoctorDetailView: UIViewController {
    
    // MARK: - Properties
    private let uv = UIView().then {
        $0.layer.backgroundColor = UIColor.white.cgColor
    }
    
    private lazy var doctorName = UILabel().then {
        $0.numberOfLines = 0
        $0.attributedText = attributedStateText(label1: "김민지 ", label2: "의사")
    }
    
    private let roundUV = UIView().then {
        $0.layer.backgroundColor = UIColor(rgb: 0x32D583).cgColor
        $0.layer.cornerRadius = 12
    }
    
    private let statusLabel = UILabel().then {
        $0.textColor = .white
        $0.attributedText = "진료가능".styled(with: bold14Style)
    }
    
    private let hospitalName = UILabel().then {
        $0.attributedText = "부산 카톨릭대학교 병원".styled(with: regular16Style)
        $0.textColor = UIColor(rgb: 0x5C5C5C)
    }
    
    private let jinryoSigan = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 16)
        $0.text = "진료시간"
        $0.textColor = UIColor(rgb: 0x434343)
    }
    
    private let jinryoHow = UILabel().then {
        $0.font = UIFont(name: "Pretendard-Bold", size: 16)
        $0.text = "진료방법"
        $0.textColor = UIColor(rgb: 0x434343)
    }
    
    private let timeLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard", size: 16)
        $0.text = "09:00~12:00"
        $0.textColor = UIColor(rgb: 0x5C5C5C)
    }
    
    private let descLabel = UILabel().then {
        $0.font = UIFont(name: "Pretendard", size: 16)
        $0.text = "음성진료,화상진료"
        $0.textColor = UIColor(rgb: 0x5C5C5C)
    }
    
    private let roundUiView1 = UIView().then {
        $0.layer.cornerRadius = 13
        $0.layer.backgroundColor = UIColor(red: 0.941, green: 0.976, blue: 1, alpha: 1).cgColor
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(rgb: 0x36BFFA).cgColor
    }
    
    private let round1Text = UILabel().then {
        $0.textColor = UIColor(rgb: 0x36BFFA)
        $0.attributedText = "비뇨기과".styled(with: regular14Style)
    }
    
    private let roundUiView2 = UIView().then {
        $0.layer.cornerRadius = 13
        $0.layer.backgroundColor = UIColor(red: 0.941, green: 0.976, blue: 1, alpha: 1).cgColor
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(rgb: 0x36BFFA).cgColor
    }
    
    private let round2Text = UILabel().then {
        $0.textColor = UIColor(rgb: 0x36BFFA)
        $0.attributedText = "가정의학과".styled(with: regular14Style)
    }
    
    private let doctorImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "doctorKim_1")
    }
    
    private let divider = UIView().then {
        $0.layer.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.976, alpha: 1).cgColor
    }
    
    private var segmentUIView = UIView().then {
        $0.backgroundColor = .white
    }
    
    lazy var segmentedButtonsView:SegmentedButtonsView = {
       let segmentedButtonsView = SegmentedButtonsView()
        
        segmentedButtonsView.setLabelsTitles(titles: ["의사 정보", "병원 정보"])
        segmentedButtonsView.translatesAutoresizingMaskIntoConstraints = false
        segmentedButtonsView.backgroundColor = UIColor.white
        segmentedButtonsView.layer.borderColor = UIColor.white.cgColor
        segmentedButtonsView.layer.borderWidth = 0.5
        return segmentedButtonsView
    }()
    
    lazy var collectionView:UICollectionView = {
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumInteritemSpacing = 1
        collectionViewFlowLayout.minimumLineSpacing = 1
     
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        
      
        collectionView.isPagingEnabled = true
        
   
        collectionView.indicatorStyle = .white
        return collectionView
    }()
    
    private let doctorDesc = UILabel().then {
        $0.numberOfLines = 0
        $0.text = "안녕하세요.\n부산 카톨릭대학교 병원 김민지 의사입니다.\n\n진료 신청서에 증상을 자세하게 입력 해주시면 \n진료에 도움이 됩니다.\n\n정부 방침에 따라 일부 항목은 진료와 처방에\n제한이 있을 수 있습니다.\n\n건강을 기원합니다.\n감사합니다."
        $0.textColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1)
    }
    
    private let licenseNumUiView = UIView().then {
        $0.layer.backgroundColor = UIColor(rgb: 0xF8F8F9).cgColor
        $0.layer.cornerRadius = 12
    }
    
    private let licenseNumLabel = UILabel().then {
        $0.attributedText = "김민지 의사 (면허번호 111111)".styled(with: regular14Style)
        $0.textColor = UIColor(rgb: 0x808080)
    }
    
    private let requestBtn = UIButton(type: .system).then {
        $0.addTarget(self, action: #selector(gotoPayment), for: .touchUpInside)
        $0.layer.cornerRadius = 16
        $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 20)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.setTitle("진료 신청", for: .normal)
        $0.backgroundColor = UIColor(rgb: 0x36BFFA)
    }
    
    weak var delegate: CollectionViewDidScrollDelegate?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavi()
        configureUI()
        view.backgroundColor = .white
    }
    
    // MARK: - Helpers
    func configureNavi() {
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
        navigationItem.title = "의료진 정보"
    }
    
    func configureUI() {
        view.addSubview(uv)
        uv.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(212)
        }
        
        uv.addSubview(doctorName)
        doctorName.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(20)
            $0.width.equalTo(110)
            $0.height.equalTo(36)
        }
        
        
        roundUV.addSubview(statusLabel)
        statusLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        uv.addSubview(roundUV)
        roundUV.snp.makeConstraints {
            $0.width.equalTo(72)
            $0.height.equalTo(25)
            $0.centerY.equalTo(doctorName.snp.centerY)
            $0.left.equalTo(doctorName.snp.right).offset(20)
        }
        
        uv.addSubview(hospitalName)
        hospitalName.snp.makeConstraints {
            $0.width.equalTo(181)
            $0.height.equalTo(24)
            $0.top.equalTo(doctorName.snp.bottom).offset(3)
            $0.left.equalTo(doctorName.snp.left)
        }
        
        uv.addSubview(jinryoSigan)
        jinryoSigan.snp.makeConstraints {
            $0.top.equalTo(hospitalName.snp.bottom).offset(16)
            $0.left.equalTo(hospitalName.snp.left)
        }
        
        uv.addSubview(timeLabel)
        timeLabel.snp.makeConstraints {
            $0.centerY.equalTo(jinryoSigan.snp.centerY)
            $0.left.equalTo(jinryoSigan.snp.right).offset(8)
        }
        
        uv.addSubview(jinryoHow)
        jinryoHow.snp.makeConstraints {
            $0.top.equalTo(jinryoSigan.snp.bottom).offset(4)
            $0.left.equalTo(hospitalName.snp.left)
        }
        
        uv.addSubview(descLabel)
        descLabel.snp.makeConstraints {
            $0.centerY.equalTo(jinryoHow.snp.centerY)
            $0.left.equalTo(jinryoSigan.snp.right).offset(8)
        }
        
        roundUiView1.addSubview(round1Text)
        round1Text.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        uv.addSubview(roundUiView1)
        roundUiView1.snp.makeConstraints {
            $0.width.equalTo(72)
            $0.height.equalTo(25)
            $0.left.equalTo(jinryoHow.snp.left)
            $0.top.equalTo(jinryoHow.snp.bottom).offset(16)
        }
        
        roundUiView2.addSubview(round2Text)
        round2Text.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        uv.addSubview(roundUiView2)
        roundUiView2.snp.makeConstraints {
            $0.width.equalTo(72)
            $0.height.equalTo(25)
            $0.left.equalTo(roundUiView1.snp.right).offset(6)
            $0.top.equalTo(jinryoHow.snp.bottom).offset(16)
        }
        
        uv.addSubview(doctorImage)
        doctorImage.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(100)
            $0.right.equalToSuperview().inset(20)
            $0.top.equalToSuperview().offset(20)
        }
        
        view.addSubview(divider)
        divider.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(10)
            $0.top.equalTo(uv.snp.bottom)
        }
        
        segmentedButtonsView.segmentedControlDelegate = self
        view.addSubview(segmentedButtonsView)
        
        segmentedButtonsView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(56)
            $0.top.equalTo(divider.snp.bottom)
        }
        
        view.addSubview(doctorDesc)
        doctorDesc.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(100)
            $0.top.equalTo(segmentedButtonsView.snp.bottom).offset(10)
        }
        
        licenseNumUiView.addSubview(licenseNumLabel)
        licenseNumLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        view.addSubview(licenseNumUiView)
        licenseNumUiView.snp.makeConstraints {
            $0.height.equalTo(57)
            $0.top.equalTo(doctorDesc.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        view.addSubview(requestBtn)
        requestBtn.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(58)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        view.bringSubviewToFront(requestBtn)
    }
    
    // MARK: - Actions
    @objc func backbutton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func gotoPayment() {
        let paymentController = PaymentViewController()
        navigationController?.pushViewController(paymentController, animated: true)
    }
    
    func attributedStateText(label1: String, label2: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: label1, attributes: [.font: UIFont(name: "Pretendard-Bold", size: 24), .foregroundColor: UIColor.black])
        attributedText.append(NSAttributedString(string: label2, attributes: [.font: UIFont(name: "Pretendard", size: 24), .foregroundColor: UIColor.black]))
        
        return attributedText
    }
    
    
    
}

extension DoctorDetailView: SegmentedControlDelegate {
    func didIndexChanged(at index: Int) {
        if index == 0 {
            // scroll forward
            let collectionBounds = self.collectionView.bounds
            let contentOffset = CGFloat(floor(self.collectionView.contentOffset.x - collectionBounds.size.width))
            self.moveToFrame(contentOffset: contentOffset)
            
        }else if index == 1 {
            // scroll backward
            let collectionBounds = self.collectionView.bounds
            let contentOffset = CGFloat(floor(self.collectionView.contentOffset.x + collectionBounds.size.width))
            self.moveToFrame(contentOffset: contentOffset)
        }
    }
    
    func moveToFrame(contentOffset : CGFloat) {

        let frame: CGRect = CGRect(x : contentOffset ,y : self.collectionView.contentOffset.y ,width : self.collectionView.frame.width,height : self.collectionView.frame.height)
        self.collectionView.scrollRectToVisible(frame, animated: true)
    }
}




#if DEBUG

import SwiftUI

struct DoctorDetailViewPresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        DoctorDetailView()
    }
}

struct DoctorDetailViewPrepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        DoctorDetailViewPresentable()
            .previewDevice("iPhone 12 mini")
            .previewDisplayName("iPhone 12 mini")
            .ignoresSafeArea()
    }
}

#endif
