//
//  GMDIcon+Extensions.swift
//  GMD Swift
//
//  Created by Rob Jonson on 14/09/2018.
//  Copyright © 2018 Patrik Vaberer. All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {
    
    /**
     To set an icon, use i.e. `buttonName.setGMDIcon(GMDType.GMBPublic, forState: .Normal)`
     */
    func setGMDIcon(_ icon: GMDType, forState state: UIControl.State = .normal, iconSize:CGFloat? = nil) {
        
        if let titleLabel = titleLabel {
            titleLabel.font = GMDFont.font(size: iconSize ?? titleLabel.font.pointSize)
            setTitle(icon.text, for: state)
        }
    }
}

public extension UILabel {
    
    /**
     To set an icon, use i.e. `labelName.GMDIcon = GMDType.GMDAdjust`
     */
    var GMDIcon: GMDType? {
        
        set {
            
            if let newValue = newValue {
                font = GMDFont.font(size: self.font.pointSize)
                text = newValue.text
            }
        }
        
        get {
            
            if text?.utf16.count == 1 {
                return GMDType(rawValue: Int(text!.utf16.first!))
            }
            
            return nil
        }
    }
}

public extension UIBarButtonItem {
    
    /**
     To set an icon, use i.e. `barName.GMDIcon = GMDType.GMDPublic`
     */
    func setGMDIcon(_ icon: GMDType, iconSize: CGFloat) {
        
        GMDFont.loadFontIfNeeded()
        let font = GMDFont.font(size: iconSize)

        setTitleTextAttributes([NSAttributedString.Key.font: font], for: UIControl.State())
        title = icon.text
    }
    
    /**
     To set an icon, use i.e. `barName.setGMDIcon(GMDType.GMDPublic, iconSize: 35)`
     */
    var GMDIcon: GMDType? {
        set {
            let font = GMDFont.font(size: 23)
            setTitleTextAttributes([NSAttributedString.Key.font: font], for: UIControl.State())
            title = newValue?.text
        }
        
        get {
            
            if title?.utf16.count == 1 {
                return GMDType(rawValue: Int(title!.utf16.first!))
            }
            
            return nil
        }
    }
}
