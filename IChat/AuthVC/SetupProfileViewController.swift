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
    private let fillImageView = AddPhotoView()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    // MARK: - Setup Constraints
    private func setupConstraints() {
        view.backgroundColor = .white

        [fillImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            fillImageView.topAnchor.constraint(equalTo: view.topAnchor, constant:  160),
            fillImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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
