//
//  AuthViewController.swift
//  IChat
//

import UIKit
import SwiftUI

class AuthViewController: UIViewController {

    // MARK: - Subviews

    private let logoImageView = UIImageView(image: UIImage(named: "Logo"), contentMode: .scaleAspectFit)
    private lazy var googleLabel = UILabel(text: "Get started with")
    private lazy var emailLabel = UILabel(text: "Or sign up with")
    private lazy var alreadyOnboardLabel = UILabel(text: "Already onboard?")

    private let googleButton = UIButton(
        title: "Google",
        titleColor: .black,
        backgroundColor: .white,
        isShadow: true)

    private let emailButton = UIButton(
        title: "Email",
        titleColor: .white,
        backgroundColor: .blackDark())

    private let LoginButton = UIButton(
        title: "Login",
        titleColor: .buttonRed(),
        backgroundColor: .white,
        isShadow: true)

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

// MARK: - SWiftUI Preview

struct AuthViewControllerVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = AuthViewController()

        func makeUIViewController(context: Context) -> AuthViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
