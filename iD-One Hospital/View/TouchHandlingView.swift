//
//  TouchHandlingView.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/12/08.
//

import Foundation
import UIKit

class TouchHandlingView: UIView {
    lazy var handlingPhaseLabel: UILabel = {
        let label = UILabel()
        label.text = "Display Handling Phase"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setAutolayout()
        backgroundColor = .white
    }
    
    private func setAutolayout() {
        addSubview(handlingPhaseLabel)
        handlingPhaseLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Handlig method
extension TouchHandlingView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handlingPhaseLabel.text = "touches Began"
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handlingPhaseLabel.text = "touches Moved"
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        handlingPhaseLabel.text = "touches Ended"
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        handlingPhaseLabel.text = "touches Cancelled"
    }
}
