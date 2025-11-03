//
//  SelfConfigureCell.swift
//  IChat
//
//  Created by Гость on 03.11.2025.
//

import Foundation

protocol SelfConfigureCell {
    static var reuseID: String { get }
    func configure(with: MChat)
}
