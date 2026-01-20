//
//  ProfileViewController.swift
//  IChat
//
//  Created by Гость on 19.01.2026.
//

import UIKit
import SwiftUI

final class ProfileViewController: UIViewController {

    // MARK: - Properties

    // MARK: - Private properties

    // MARK: - SubViews
    private let containerView = UIView()
    private let imageView = UIImageView(image: UIImage(named: "human3"), contentMode: .scaleAspectFill)
    private let nameLabel = UILabel(text: "Peter Ben", font: .systemFont(ofSize: 20, weight: .light))
    private let aboutMeLabel = UILabel(
        text: "The opportunity to chat with the best man in the world",
        font: .systemFont(ofSize: 16, weight: .light)
    )
    private let myTextField = InsertableTextField()

    // MARK: - Init

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }

    // MARK: - Setup Views
    private func setupSubviews() {
        view.backgroundColor = .white

        [containerView, imageView, nameLabel, aboutMeLabel, myTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        aboutMeLabel.numberOfLines = 0
        containerView.backgroundColor = .mainWhite
        containerView.layer.cornerRadius = 30
        containerView.clipsToBounds = true

        if let button = myTextField.rightView as? UIButton {
            button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        }

        [imageView, containerView].forEach { view.addSubview($0) }
        [nameLabel, aboutMeLabel, myTextField].forEach { containerView.addSubview($0) }
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
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
            containerView.heightAnchor.constraint(equalToConstant: 206),

            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),

            aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            aboutMeLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),

            myTextField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 8),
            myTextField.leadingAnchor.constraint(equalTo: aboutMeLabel.leadingAnchor),
            myTextField.trailingAnchor.constraint(equalTo: aboutMeLabel.trailingAnchor),
            myTextField.heightAnchor.constraint(equalToConstant: 48),
        ])
    }

    // MARK: - Methods

    // MARK: - Private Methods
    @objc
    private func sendMessage() {
        print(#function)
    }
}

// MARK: - SwiftUI Preview
struct ProfileViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let profileViewController = ProfileViewController()

        func makeUIViewController(context: Context) -> ProfileViewController {
            return profileViewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
