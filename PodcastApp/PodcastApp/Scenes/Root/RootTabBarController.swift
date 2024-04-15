//
//  RootTabBarController.swift
//  PodcastApp
//
//  Created by Yunus Emre Berdibek on 16.04.2024.
//

import UIKit

final class RootTabBarController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        let appearance = UINavigationBarAppearance()

        appearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = prepareControllers()
    }

    private func prepareControllers() -> [UIViewController] {
        let controller1 = UINavigationController(rootViewController: PodcastListViewController())
        let controller2 = UINavigationController(rootViewController: SearchViewController())
        let controller3 = UINavigationController(rootViewController: FavoritesListViewController())

        controller1.tabBarItem = UITabBarItem(
            title: "Feed",
            image: UIImage(systemName: "list.clipboard"),
            selectedImage: UIImage(systemName: "list.clipboard.fill"))

        controller2.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))

        controller3.tabBarItem = UITabBarItem(
            title: "Favorites",
            image: UIImage(systemName: "heart"),
            selectedImage: UIImage(systemName: "heart.fill"))

        return [
            createController(controller: PodcastListViewController(),
                             title: "Podcasts",
                             systemName: "list.clipboard",
                             selectedSystemName: "list.clipboard.fill"),

            createController(controller: SearchViewController(),
                             title: "Search",
                             systemName: "magnifyingglass",
                             selectedSystemName: "magnifyingglass.circle.fill"),

            createController(controller: FavoritesListViewController(),
                             title: "Favorites",
                             systemName: "heart",
                             selectedSystemName: "heart.fill")
        ]
    }

    private func createController(controller: UIViewController, title: String, systemName: String, selectedSystemName: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)

        navigationController.tabBarItem = UITabBarItem(title: title,
                                                       image: UIImage(systemName: systemName),
                                                       selectedImage: UIImage(systemName: selectedSystemName))

        navigationController.navigationItem.largeTitleDisplayMode = .inline
        navigationController.navigationBar.prefersLargeTitles = true

        return navigationController
    }
}
