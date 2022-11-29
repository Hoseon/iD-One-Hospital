//
//  UIFont+Ext.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/16.
//

import Foundation
import UIKit

extension UIFont {
    public enum PretendardType: String {
        case regular = "-Regular"
        case bold = "-Bold"
    }
    
    static func Pretendard(_ type: PretendardType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Pretendard\(type.rawValue)", size: size)!
    }
}
