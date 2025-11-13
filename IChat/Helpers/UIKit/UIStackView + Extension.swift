//
//  UIStackView + Extension.swift
//  IChat
//
//  Created by Гость on 21.10.2025.
//

import UIKit

extension UIStackView {

    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat ) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
    }
}
