//
//  Colors.swift
//  mila
//
//  Created by Muhammad Nashrullah on 27/10/20.
//  Copyright © 2020 BK. All rights reserved.
//

import SwiftUI

extension Color {
    static var ring1color1: Color {
        return Color("ring1color1")
    }
    static var ring1color2:Color {
        return Color("ring1color2")
    }
    static var ring2color1:Color {
        return Color("ring2color1")
    }
    static var ring2color2:Color {
        return Color("ring2color2")
    }
    static var ring3color1:Color {
        return Color("ring3color1")
    }
    static var ring3color2:Color {
        return Color("ring3color2")
    }
    static var primary: Color{
        return Color("primary")
    }
}
extension UIColor {

    static let primary = UIColor(red: 244, green: 234, blue: 222, alpha: 100)

}

extension UIColor {
    var color: Color {
        get {
            let rgbColours = self.cgColor.components
            return Color(
                red: Double(rgbColours![0]),
                green: Double(rgbColours![1]),
                blue: Double(rgbColours![2])
            )
        }
    }
}
//
//extension UIColor {
//    var color: Color { Color(self) }
//}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
