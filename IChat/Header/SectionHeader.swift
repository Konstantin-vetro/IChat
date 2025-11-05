//
//  SectionHeader.swift
//  IChat
//
//  Created by Гость on 04.11.2025.
//

import UIKit

final class SectionHeader: UICollectionReusableView {

    static let reuseId: String = "SectionHeader"

    private let title = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configurateSectionHeader(text: String, font: UIFont?, textColor: UIColor) {
        title.text = text
        title.font = font
        title.textColor = textColor
    }

    private func setupSubView() {
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)

        setupConstraint()
    }

    private func setupConstraint() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
