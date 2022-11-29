//
//  CarouselCell.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/22.
//
import UIKit
import Then
import SnapKit

class CarouselCell: UICollectionViewCell {
    
    // MARK: - SubViews
    
    private lazy var imageView = UIImageView()
    private lazy var textLabel = UILabel()
    
    private let roundView = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(rgb: 0xE6E6E6).cgColor
        $0.layer.backgroundColor = UIColor(rgb: 0xFFFFFF).cgColor
        $0.layer.cornerRadius = 20
    }
    
    private let slideLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.attributedText = "스마트 문진으로\n더욱 정확한 진료 보기".styled(with: bold18height26Style)
    }
    
    private let slideSubLabel = UILabel().then {
        $0.numberOfLines = 1
        $0.attributedText = "어디아파 비대면 진료 사용법을 알아보세요".styled(with: regular14grayStyle)
    }
    
    private let slideBannerImg = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "slide_banner01")
        
    }
    
    
    // MARK: - Properties
    
    static let cellId = "CarouselCell"
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}

// MARK: - Setups
private extension CarouselCell {
    func setupUI() {
        backgroundColor = .blue
        
        roundView.addSubview(slideLabel)
        slideLabel.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(16)
        }
        
        roundView.addSubview(slideSubLabel)
        slideSubLabel.snp.makeConstraints {
            $0.left.equalTo(slideLabel)
            $0.top.equalTo(slideLabel.snp.bottom).offset(4)
        }
        
        roundView.addSubview(slideBannerImg)
        slideBannerImg.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.right.equalToSuperview().inset(16)
        }
        
        addSubview(roundView)
        roundView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.height.equalTo(123)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
    }
}

// MARK: - Public
extension CarouselCell {
    public func configure(image: UIImage?, text: String) {
        imageView.image = image
        textLabel.text = text
    }
}
