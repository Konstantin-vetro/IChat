//
//  MainTabbarController.swift
//  IChat
//
//  Created by Гость on 25.10.2025.
//

import UIKit

final class MainTabbarController: UITabBarController {

    // MARK: - Controllers
    private let listVC = ListViewController()
    private let peopleVC = PeopleViewController()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    // MARK: - SetupTabbar
    private func setupTabBar() {
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .medium )

        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfiguration)
        let convImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfiguration)

        tabBar.tintColor = #colorLiteral(red: 0.629904747, green: 0.4648939967, blue: 0.9760698676, alpha: 1)
        viewControllers = [
            generateNavigationViewController(
                rootViewController: listVC,
                title: "Conversations",
                image: convImage ?? UIImage()),
            generateNavigationViewController(
                rootViewController: peopleVC,
                title: "People",
                image: peopleImage ?? UIImage()
            )
        ]
    }

    // MARK: - generate NavigationVC
    private func generateNavigationViewController(
        rootViewController: UIViewController,
        title: String,
        image: UIImage
    ) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
