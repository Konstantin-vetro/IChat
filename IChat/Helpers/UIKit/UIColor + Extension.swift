//
//  UIColor + Extension.swift
//  IChat
//
//  Created by Гость on 20.10.2025.
//

import UIKit

extension UIColor {
    static var buttonRed: UIColor { UIColor(named: "buttonRed") ?? UIColor.red }
    static var mainWhite: UIColor { UIColor(named: "mainWhite") ?? UIColor.white }
    static var blackDark: UIColor { UIColor(named: "blackDark") ?? UIColor.darkGray }
    static var textFieldLight: UIColor { UIColor(named: "textFieldLight") ?? UIColor.lightGray }
    static var gradientColorFrom: UIColor { UIColor(named: "GradientColorFrom") ?? UIColor.systemPurple }
    static var gradientColorTo: UIColor { UIColor(named: "GradientColorTo") ?? UIColor.systemBlue }
    static var shadowColorCell: UIColor { UIColor(named: "shadowColorCell") ?? UIColor.gray }
}
