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
            fontURL = iconBundle.url(forResource: fontName,
                                     withExtension: "ttf",
                                     subdirectory: "HS-Google-Material-Design-Icons.bundle")!
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
    
    private static let loadingError = "FontIcon not found in the bundle or not associated with Info.plist when manual installation was performed. ******"
    
    /// Get the font
    ///
    /// - Parameter size: point size
    /// - Returns: UIFont
    func font(size:CGFloat) -> UIFont {
        _ = loadFontIfNeeded
        
        let font = UIFont(name: fontName, size: size)
        assert(font != nil, FontIconFontLoader.loadingError)
        return font!
    }
}
