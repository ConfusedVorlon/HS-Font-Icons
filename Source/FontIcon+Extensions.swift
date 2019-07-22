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
    func setIcon(_ icon: FontIcon, forState state: UIControl.State = .normal, iconSize:CGFloat? = nil, color: UIColor? = nil) {

        if let titleLabel = titleLabel {
            titleLabel.font = type(of: icon).font(size: iconSize ?? titleLabel.font.pointSize)
            setTitle(icon.text, for: state)

            if let color = color {
                self.setTitleColor(color, for: state)
            }
        }
    }
}

public extension UILabel {

    func setIcon(_ icon:FontIcon)
    {
        font = type(of: icon).font(size: self.font.pointSize)
        text = icon.text
    }

}

public extension UIBarButtonItem {

    /**
     To set an icon, use i.e. `barName.setIcon(GMDIcon._public)`
     */
    func setIcon(_ icon: FontIcon, iconSize: CGFloat = 23) {

        let font = type(of: icon).font(size: iconSize)

        setTitleTextAttributes([NSAttributedString.Key.font: font], for: UIControl.State())
        title = icon.text
    }

}
