//
//  ChatRequestViewController.swift
//  IChat
//
//  Created by Гость on 21.01.2026.
//

import UIKit
import SwiftUI

final class ChatRequestViewController: UIViewController {

    // MARK: - Properties

    // MARK: - Private properties

    // MARK: - SubViews
    private let containerView = UIView()
    private let imageView = UIImageView(image: UIImage(named: "human3"), contentMode: .scaleAspectFill)
    private let nameLabel = UILabel(text: "Peter Ben", font: .systemFont(ofSize: 20, weight: .light))
    private let aboutMeLabel = UILabel(
        text: "You have the opportunity to to start a new chat",
        font: .systemFont(ofSize: 16, weight: .light)
    )
    private let acceptButton = UIButton(title: "Accept", titleColor: .white, backgroundColor: .black, font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    private let denyButton = UIButton(title: "Deny", titleColor: .buttonRed, backgroundColor: .mainWhite, font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)

    // MARK: - Init

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.acceptButton.applyGradients(cornerRadius: 10)
    }

    // MARK: - Setup Views
    private func setupSubviews() {
        view.backgroundColor = .mainWhite

        [containerView, imageView, nameLabel, aboutMeLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        [imageView, containerView].forEach { view.addSubview($0) }
        [nameLabel, aboutMeLabel].forEach { containerView.addSubview($0) }

        customizeSubviews()
        setupConstraints()
    }

    private func customizeSubviews() {
        containerView.backgroundColor = .mainWhite
        containerView.layer.cornerRadius = 30
        containerView.clipsToBounds = true

        denyButton.layer.borderWidth = 1.2
        denyButton.layer.borderColor = UIColor.buttonRed.cgColor
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        let buttonsStackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 10)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.distribution = .fillEqually
        containerView.addSubview(buttonsStackView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
        ])

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 206)
        ])

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
        ])

        NSLayoutConstraint.activate([
            aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            aboutMeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            buttonsStackView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 24),
            buttonsStackView.leadingAnchor.constraint(equalTo: aboutMeLabel.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: aboutMeLabel.trailingAnchor),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
}

// MARK: - SwiftUI Preview
struct ChatRequestVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let chatRequestVC = ChatRequestViewController()

        func makeUIViewController(context: Context) -> ChatRequestViewController {
            return chatRequestVC
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
