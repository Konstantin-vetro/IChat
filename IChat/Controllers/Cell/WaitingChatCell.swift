//
//  WaitingChatCell.swift
//  IChat
//
//  Created by Гость on 03.11.2025.
//

import UIKit
import SwiftUI

final class WaitingChatCell: UICollectionViewCell, SelfConfigureCell {

    static var reuseID: String = "WaitingChatCell"

    private let friendImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: MChat) {
        friendImageView.image = UIImage(named: model.userImageString)
    }

    private func setupCell() {
        self.layer.cornerRadius = 4
        self.clipsToBounds = true

        backgroundColor = .red

        setupViews()
    }

    private func setupViews() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(friendImageView)

        setupConstraint()
    }

    private func setupConstraint() {
        NSLayoutConstraint.activate([
            friendImageView.topAnchor.constraint(equalTo: self.topAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

// MARK: - SwiftUI Preview
struct WaitingChatCellProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let cell = MainTabbarController()

        func makeUIViewController(context: Context) -> MainTabbarController {
            return cell
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
