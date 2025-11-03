//
//  ActiveChatCell.swift
//  IChat
//
//  Created by Гость on 31.10.2025.
//

import UIKit
import SwiftUI

final class ActiveChatCell: UICollectionViewCell, SelfConfigureCell {

    // MARK: - Properties
    static var reuseID: String = "activeCellId"

    // MARK: - SubViews
    private let friendImageView = UIImageView()
    private let friendNameLabel = UILabel(text: "User name", font: .laoSangamMN20())
    private let lastMessageLabel = UILabel(text: "How are you?", font: .laoSangamMN18())
    private let gradientView = GradientView(
        from: .topTrailing,
        to: .bottomLeading,
        startColor: .gradientColorFrom,
        endColor: .gradientColorTo
    )

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure Cell
    func configure(with model: MChat) {
        friendImageView.image = UIImage(named: model.userImageString)
        friendNameLabel.text = model.username
        lastMessageLabel.text = model.lastMessage
    }

    // MARK: - Setup Views
    private func setupViews() {
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        friendImageView.backgroundColor = .orange
        gradientView.backgroundColor = .blue

        [friendImageView, friendNameLabel, lastMessageLabel, gradientView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        setupContraints()
    }

    // MARK: - Setup Constraints
    private func setupContraints() {
        NSLayoutConstraint.activate([
            friendImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            friendImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
            friendImageView.widthAnchor.constraint(equalToConstant: 78)
        ])

        NSLayoutConstraint.activate([
            friendNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            friendNameLabel.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            friendNameLabel.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            lastMessageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            lastMessageLabel.leadingAnchor.constraint(equalTo: friendNameLabel.leadingAnchor),
            lastMessageLabel.trailingAnchor.constraint(equalTo: friendNameLabel.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            gradientView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gradientView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            gradientView.topAnchor.constraint(equalTo: contentView.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            gradientView.widthAnchor.constraint(equalToConstant: 8)
        ])
    }
}

// MARK: - SwiftUI Preview
struct ActiveChatCellProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let cells = MainTabbarController()

        func makeUIViewController(context: Context) -> MainTabbarController {
            return cells
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
