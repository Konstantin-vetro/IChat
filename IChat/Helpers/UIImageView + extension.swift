//
//  UIImageView + extension.swift
//  IChat
//
//  Created by Гость on 21.10.2025.
//

import UIKit

extension UIImageView {

    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()

        self.image = image
        self.contentMode = contentMode
    }
}
