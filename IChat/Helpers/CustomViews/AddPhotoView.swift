//
//  AddPhotoView.swift
//  IChat
//
//  Created by Гость on 24.10.2025.
//

import UIKit

final class AddPhotoView: UIView {

    // MARK: - Subviews
    private let personImage = UIImage(named: "avatar")
    private let plusImage = UIImage(named: "plus")

    private lazy var circleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = personImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()

    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(plusImage, for: .normal)
        button.tintColor = .blackDark()
        return button
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2
        circleImageView.layer.masksToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        addSubview(circleImageView)
        addSubview(plusButton)

        NSLayoutConstraint.activate([
            circleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            circleImageView.topAnchor.constraint(equalTo: topAnchor),
            circleImageView.widthAnchor.constraint(equalToConstant: 120),
            circleImageView.heightAnchor.constraint(equalToConstant: 120),

            plusButton.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 16),
            plusButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30)
        ])

        self.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: plusButton.trailingAnchor).isActive = true
    }
}
