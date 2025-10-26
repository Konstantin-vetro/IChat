//
//  PeopleViewController.swift
//  IChat
//
//  Created by Гость on 25.10.2025.
//

import UIKit
import SwiftUI

final class PeopleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
}

// MARK: - SwiftUI Preview
struct PeopleVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let tabbarController = MainTabbarController()

        func makeUIViewController(context: Context) -> MainTabbarController {
            return tabbarController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
