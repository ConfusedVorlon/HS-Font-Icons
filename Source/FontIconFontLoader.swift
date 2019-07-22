//
//  GMDFont.swift
//  GMD Swift
//
//  Created by Rob Jonson on 14/09/2018.
//  Copyright © 2018 Patrik Vaberer. All rights reserved.
//

import Foundation
import UIKit


public class FontIconFontLoader {
    let fileName:String
    let fontName:String

    public init(fileName:String, fontName:String) {
        self.fileName = fileName
        self.fontName = fontName
    }


    private func loadFont()
    {
        let iconBundle = Bundle(for: FontIconFontLoader.self)
        var fontURL:URL!
        let identifier = iconBundle.bundleIdentifier!

        if identifier.hasPrefix("org.cocoapods") {

            let fontBundleURL = iconBundle.resourceURL?.appendingPathComponent(fontName).appendingPathExtension("bundle")
            print("fontBundleURL: \(String(describing: fontBundleURL))")
            let resourceBundle = Bundle(url: fontBundleURL!)!
            fontURL = resourceBundle.url(forResource: fileName,
                                     withExtension: "ttf")!
        } else {
            fontURL = iconBundle.url(forResource: fileName, withExtension: "ttf")!
        }

        let data = try! Data(contentsOf: fontURL)

        let provider = CGDataProvider(data: data as CFData)!
        let font = CGFont(provider)!

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {

            let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }

    lazy var loadFontIfNeeded:Bool = {
        if (UIFont.fontNames(forFamilyName: fontName).count == 0) {
            loadFont()
        }
        return true
    }()



    /// Get the font
    ///
    /// - Parameter size: point size
    /// - Returns: UIFont
    func font(size:CGFloat) -> UIFont {
        _ = loadFontIfNeeded

        let font = UIFont(name: fontName, size: size)
        guard font != nil else {
            print("loaded fonts:")
            UIFont.familyNames.forEach({ familyName in
                let fontNames = UIFont.fontNames(forFamilyName: familyName)
                print(familyName, fontNames)
            })
            fatalError("failed to load \(fontName)")
        }

        return font!
    }
}
