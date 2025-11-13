//
//  UserCell.swift
//  IChat
//
//  Created by Гость on 11.11.2025.
//

import UIKit
import SwiftUI

final class UserCell: UICollectionViewCell, SelfConfigureCell {

    // MARK: - Properties
    static var reuseID: String = "UserCellIdentifier"

    // MARK: - SubViews
    private let userImageVIew = UIImageView()
    private let userName = UILabel(text: "text", font: .laoSangamMN20())
    private let containerView = UIView()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - LifeCycle
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 4
        containerView.clipsToBounds = true
    }

    // MARK: - Configure Cell
    func configure<U>(with value: U) where U : Hashable {
        guard let user: MUser = value as? MUser else { return }
        userImageVIew.image = UIImage(named: user.avatarStringURL)
        userName.text = user.username
    }

    // MARK: - Setup Cell
    private func setupCell() {
        backgroundColor = .white
        self.layer.cornerRadius = 4

        setupShadow()
        setupConstraints()
    }

    private func setupShadow() {
        self.layer.shadowColor = UIColor.shadowColorCell.cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }

    // MARK: - Layout + Constraints
    private func setupConstraints() {
        [userImageVIew, userName, containerView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        addSubview(containerView)
        containerView.addSubview(userImageVIew)
        containerView.addSubview(userName)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            userImageVIew.topAnchor.constraint(equalTo: containerView.topAnchor),
            userImageVIew.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            userImageVIew.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            userImageVIew.heightAnchor.constraint(equalTo: containerView.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: userImageVIew.bottomAnchor),
            userName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            userName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant:  -8 ),
            userName.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
}

// MARK: - SwiftUI Preview
struct UserCellProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let mainVC = MainTabbarController()

        func makeUIViewController(context: Context) -> MainTabbarController {
            return mainVC
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
