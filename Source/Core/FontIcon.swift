//
//  FontIcon.swift
//  GMD Swift
//
//  Created by Rob Jonson on 15/09/2018.
//  Copyright © 2018 Patrik Vaberer. All rights reserved.
//

import Foundation
import UIKit


public protocol FontIcon {

    /// Font loader - used internally.
    static var fontLoader:FontIconFontLoader {get}

    /// Returns the current text. You can use string manipulation to add multiple icons together
    var text: String {get}

    /// Get a UIImage of the icon
    ///
    /// - Parameters:
    ///   - size: required pixel size of the image
    ///   - color: required colour
    /// - Returns: rendered image
    func image( size : CGSize, color: UIColor) -> UIImage?

    /// Get the Icon font
    ///
    /// - Parameter size: point size
    /// - Returns: UIFont
    static func font(size:CGFloat) -> UIFont

    init?(rawValue:Int)
}



extension FontIcon where Self: RawRepresentable, Self.RawValue == Int {

    public var text: String {
        return String(utf16CodeUnits: [UInt16(self.rawValue)], count: 1)
    }

    public static func font(size:CGFloat = 23) -> UIFont {
        return Self.fontLoader.font(size:size)
    }

    public func image( size : CGSize, color: UIColor = UIColor.gray) -> UIImage? {

        // Create a context to render into.
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }

        // Work out what size of font will give us a rendering of the string
        // that will fit in an image of the desired size.

        // We do this by measuring the string at the given font size and working
        // out the ratio scale to it by to get the desired size of image.
        let string = self.text
        var font = Self.font(size: size.height)

        // Measure the string size.
        var stringSize: CGSize? = string.size(withAttributes: [NSAttributedString.Key.font : font])

        // Work out what it should be scaled by to get the desired size.
        let xRatio: CGFloat = size.width / (stringSize?.width ?? 0.0)
        let yRatio: CGFloat = size.height / (stringSize?.height ?? 0.0)
        var ratio = min(xRatio, yRatio)

        // Work out the point size that'll give us the desired image size, and
        // create a UIFont that size.
        let oldFontSize: CGFloat = font.pointSize
        let newFontSize = floor(oldFontSize * ratio)
        ratio = newFontSize / oldFontSize
        font = font.withSize(newFontSize)

        // What size is the string with this new font
        stringSize = string.size(withAttributes: [NSAttributedString.Key.font : font])

        // Work out where the origin of the drawn string should be to get it in
        // the centre of the image.
        let textOrigin = CGPoint(x: (size.width - (stringSize?.width ?? 0.0)) / 2, y: (size.height - (stringSize?.height ?? 0.0)) / 2)

        // Draw the string into out image!
        string.draw(at: textOrigin, withAttributes: [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : color])


        // We're done!  Grab the image and return it!
        // (Don't forget to end the image context first though!)
        let retImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()

        return retImage
    }
}
