//
//  UIDevice+Ext.swift
//  iD-One Hospital
//
//  Created by HoSeon Chu on 2022/11/22.
//

import UIKit

extension UIDevice {
    public var isiPhoneSE: Bool {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone && (UIScreen.main.bounds.size.height == 667 || UIScreen.main.bounds.size.width == 375) {
            return true
        }
        return false
    }
    public var isiPhonePlus: Bool {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone && (UIScreen.main.bounds.size.height == 736 || UIScreen.main.bounds.size.width == 414) {
            return true
        }
        return false
    }

    public var isiPad: Bool {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad && (UIScreen.main.bounds.size.height == 1024 || UIScreen.main.bounds.size.width == 768) {
            return true
        }
        return false
    }
    public var isiPadPro12: Bool {
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad && (UIScreen.main.bounds.size.height == 1366 || UIScreen.main.bounds.size.width == 1366) {
            return true
        }
        return false
    }
}
