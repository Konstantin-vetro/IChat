//
//  SetupProfileViewController.swift
//  IChat
//
//  Created by Гость on 24.10.2025.
//

import UIKit
import SwiftUI

final class SetupProfileViewController: UIViewController {

    // MARK: - Subviews
    private let fullImageView = AddPhotoView()

    private let welcomeLabel = UILabel(text: "Set up profile!", font: .avenir26())

    private let fullNameLabel = UILabel(text: "Full name")
    private let aboutMeLabel = UILabel(text: "About me")
    private let sexLabel = UILabel(text: "Sex")

    private let fullNameTextField = OneLineTextField(font: .avenir20())
    private let aboutMeTextField = OneLineTextField(font: .avenir20())

    private let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Female")
    private let goToChatsButton = UIButton(title: "Go to chats!", titleColor: .white, backgroundColor: .blackDark)

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    // MARK: - Setup Constraints
    private func setupConstraints() {
        view.backgroundColor = .white
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField], axis: .vertical, spacing: 0)
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel, aboutMeTextField,], axis: .vertical, spacing: 12)
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentedControl], axis: .vertical, spacing: 0)

        let stackView = UIStackView(
            arrangedSubviews: [
                fullNameStackView,
                aboutMeStackView,
                sexStackView,
                goToChatsButton
            ],
            axis: .vertical,
            spacing: 40
        )

        [welcomeLabel, fullImageView, stackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant:  160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            fullImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant:  40),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -40),

            goToChatsButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

// MARK: - SwiftUI Preview
struct SetupProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = SetupProfileViewController()

        func makeUIViewController(context: Context) -> SetupProfileViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
