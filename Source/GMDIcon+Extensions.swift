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
     To set an icon, use i.e. `buttonName.setIcon(GMDIcon.public)`
     Note that this clears any text
     */
    func setIcon(_ icon: GMDIcon, forState state: UIControl.State = .normal, iconSize:CGFloat? = nil) {
        
        if let titleLabel = titleLabel {
            titleLabel.font = GMDFont.font(size: iconSize ?? titleLabel.font.pointSize)
            setTitle(icon.text, for: state)
        }
    }
}

public extension UILabel {
    
    /**
     To set an icon, use i.e. `labelName.icon = GMDIcon.adjust`
     Note that this clears any text
     */
    var icon: GMDIcon? {
        
        set {
            
            if let newValue = newValue {
                font = GMDFont.font(size: self.font.pointSize)
                text = newValue.text
            }
        }
        
        get {
            
            if text?.utf16.count == 1 {
                return GMDIcon(rawValue: Int(text!.utf16.first!))
            }
            
            return nil
        }
    }
}

public extension UIBarButtonItem {
    
    /**
     To set an icon, use i.e. `barName.icon = GMDIcon._public`
     */
    func setIcon(_ icon: GMDIcon, iconSize: CGFloat) {
        
        let font = GMDFont.font(size: iconSize)

        setTitleTextAttributes([NSAttributedString.Key.font: font], for: UIControl.State())
        title = icon.text
    }
    
    /**
     To set an icon, use i.e. `barName.setGMDIcon(GMDIcon._public, iconSize: 35)`
     */
    var icon: GMDIcon? {
        set {
            let font = GMDFont.font(size: 23)
            setTitleTextAttributes([NSAttributedString.Key.font: font], for: UIControl.State())
            title = newValue?.text
        }
        
        get {
            
            if title?.utf16.count == 1 {
                return GMDIcon(rawValue: Int(title!.utf16.first!))
            }
            
            return nil
        }
    }
}
