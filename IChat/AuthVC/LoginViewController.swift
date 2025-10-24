//
//  LoginViewController.swift
//  IChat
//
//  Created by Гость on 23.10.2025.
//

import UIKit
import SwiftUI

final class LoginViewController: UIViewController {

    // MARK: - Subviews
    private let welcomeLabel = UILabel(text: "Wellcome back!", font: .avenir26())

    private let loginWithLabel = UILabel(text: "Login with")
    private let orLabel = UILabel(text: "or")
    private let emailLabel = UILabel(text: "Email")
    private let passwordLabel = UILabel(text: "Password")
    private let needAnAccountLabel = UILabel(text: "Need an account?")

    private let emailTextField = OneLineTextField(font: .avenir20())
    private let passwordTextField = OneLineTextField(font: .avenir20())

    private let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    private let loginButton = UIButton(title: "Login", titleColor: .white, backgroundColor: .blackDark())

    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.buttonRed(), for: .normal)
        button.titleLabel?.font = .avenir20()
        button.contentHorizontalAlignment = .leading
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        googleButton.customizeGoogleButton()
        setupConstraints()
    }
    
    // MARK: - Setup Constrains
    private func setupConstraints() {
        view.backgroundColor = .white
        let loginWithStackView = ButtonFormView(label: loginWithLabel, button: googleButton)
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)

        let stackView = UIStackView(
            arrangedSubviews: [
                loginWithStackView,
                orLabel,
                emailStackView,
                passwordStackView,
                loginButton
            ],
            axis: .vertical,
            spacing: 20
        )

        let bottomStackView = UIStackView(
            arrangedSubviews: [
                needAnAccountLabel,
                signUpButton
            ],
            axis: .horizontal,
            spacing: 10
        )
        bottomStackView.alignment = .firstBaseline
        [welcomeLabel, stackView, bottomStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            signUpButton.heightAnchor.constraint(equalToConstant: 60),
            loginButton.heightAnchor.constraint(equalToConstant: 60),

            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant:  100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -40),

            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant:  60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -40)
        ])
    }
}

// MARK: - SwiftUI Preview
struct LoginVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = LoginViewController()

        func makeUIViewController(context: Context) -> LoginViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
