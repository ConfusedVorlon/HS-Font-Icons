//
//  GMDFont.swift
//  GMD Swift
//
//  Created by Rob Jonson on 14/09/2018.
//  Copyright © 2018 Patrik Vaberer. All rights reserved.
//

import Foundation
import UIKit


private struct GMDStruct {
    static let fileFontName = "GMDIcons"
    static let fontName = "MaterialIcons-Regular"
}


public class GMDFont {

    private static var loadFont:Bool = {
        var iconBundle = Bundle(for: GMDFont.self)
        var fontURL:URL!
        let identifier = iconBundle.bundleIdentifier!
        
        if identifier.hasPrefix("org.cocoapods") {
            fontURL = iconBundle.url(forResource: GMDStruct.fileFontName,
                                     withExtension: "ttf",
                                     subdirectory: "HS-Google-Material-Design-Icons.bundle")!
        } else {
            fontURL = iconBundle.url(forResource: GMDStruct.fileFontName, withExtension: "ttf")!
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
        
        return true
    }()
    
    private static func loadFontIfNeeded() {
        if (UIFont.fontNames(forFamilyName: GMDStruct.fontName).count == 0) {
            _ = GMDFont.loadFont
        }
    }
    
    private static let loadingError = "****** GOOGLE MATERIAL DESIGN ICONS SWIFT - Google Material Design icons font not found in the bundle or not associated with Info.plist when manual installation was performed. ******"
    
    /// Get the Google Material Design font
    ///
    /// - Parameter size: point size
    /// - Returns: UIFont
    static func font(size:CGFloat = 23) -> UIFont {
        GMDFont.loadFontIfNeeded()
        
        let font = UIFont(name: GMDStruct.fontName, size: size)
        assert(font != nil, GMDFont.loadingError)
        return font!
    }
}
