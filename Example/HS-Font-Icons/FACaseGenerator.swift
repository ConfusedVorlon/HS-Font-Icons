//
//  FACaseGenerator.swift
//  GMD Swift
//
//  Created by Rob Jonson on 15/09/2018.
//  Copyright © 2018 Patrik Vaberer. All rights reserved.
//

import Foundation

class FACaseGenerator {

    static func printNewCases() {

        printCases(style:"brands")
        printCases(style:"regular")
        printCases(style:"solid")
    }

    static func printCases(style:String) {

        print("\n----FontAwesome - \(style)\n\n")

        let jsonFileUrl = Bundle.main.url(forResource: "fa_icons", withExtension: "json")!

        let data = try! Data(contentsOf: jsonFileUrl, options: .mappedIfSafe)
        let jsonResult = try! JSONSerialization.jsonObject(with: data)
        if let items = jsonResult as? [String:[String:AnyObject]] {

            for (key,value) in items {
                let styles = value["styles"] as! [String]
                if !styles.contains(style) {
                    continue
                }

                var iconName = key
                iconName = iconName.replacingOccurrences(of: "-", with: "_")
                let hex = value["unicode"] as! String
                print("case \(iconName) = 0x\(hex)")
            }
        }

        print("\n\n")
    }
}


