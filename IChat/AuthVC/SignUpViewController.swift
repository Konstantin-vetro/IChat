//
//  SignUpViewController.swift
//  IChat
//
//  Created by Гость on 21.10.2025.
//

import UIKit
import SwiftUI

final class SignUpViewController: UIViewController {

    // MARK: - Private properties
    private let authService = AuthenticationService()

    // MARK: - SubViews

    private let welcomeLabel = UILabel(text: "Good to see you!", font: .avenir26())

    private let emailLabel = UILabel(text: "Email")
    private let passwordLabel = UILabel(text: "Password")
    private let confirmPasswordLabel = UILabel(text: "Confirm password")
    private let alreadyOnboardLabel = UILabel(text: "Already onboard?")

    private let emailTextField = OneLineTextField(font: .avenir20())
    private let passwordTextField = OneLineTextField(font: .avenir20())
    private let confirmPasswordTextField = OneLineTextField(font: .avenir20())

    private let signUpButton = UIButton(
        title: "Sign Up",
        titleColor: .white,
        backgroundColor: .blackDark
    )

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.buttonRed, for: .normal)
        button.titleLabel?.font = .avenir20()
        button.contentHorizontalAlignment = .leading
        return button
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupConstraints()
        signUpButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 0)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 0)
        let confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField], axis: .vertical, spacing: 0)

        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true

        let stackView = UIStackView(
            arrangedSubviews: [
                emailStackView,
                passwordStackView,
                confirmPasswordStackView,
                signUpButton
            ],
            axis: .vertical,
            spacing: 40
        )

        let bottomStackView = UIStackView(
            arrangedSubviews: [
                alreadyOnboardLabel,
                loginButton
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
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant:  160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            stackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant:  160),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -40),

            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant:  60),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -40)
        ])
    }

    // MARK: - Actions
    @objc private func signupButtonTapped() {
        authService.register(
            email: emailTextField.text,
            password: passwordTextField.text,
            confirmPassword: confirmPasswordTextField.text) { result in
                switch result {
                case .success(let user):
                    self.showAlert(with: "Успешно!", and: "Вы зарегистрированны")
                    print(user.email)
                case .failure(let error):
                    self.showAlert(with: "Warning!", and: error.localizedDescription)
                }
            }
    }
}

// MARK: - SwiftUI Preview

struct SignUpVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = SignUpViewController()

        func makeUIViewController(context: Context) -> SignUpViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}


extension UIViewController {
    func showAlert(with title: String, and message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
