//
//  RootTabBarController.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 16.04.2024.
//

import UIKit

final class RootTabBarController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)

        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()
        navAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.purple
        ]
        navAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.purple
        ]

        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance

        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = tabAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabAppearance
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .purple
        viewControllers = prepareControllers()
    }

    private func prepareControllers() -> [UIViewController] {
        [
            createController(controller: PodcastListViewController(),
                             title: "Podcasts",
                             image: .house,
                             tag: 0),

            createController(controller: SearchViewController(),
                             title: "Search",
                             image: .magnifyingglass,
                             tag: 1),

            createController(controller: FavoritesListViewController(),
                             title: "Favorites",
                             image: .heart,
                             tag: 2)
        ]
    }

    private func createController(controller: UIViewController, title: String, image: SFSymbol, tag: Int) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)

        navigationController.tabBarItem = UITabBarItem(title: title,
                                                       image: UIImage(systemName: image.systemName),
                                                       tag: tag)

        navigationController.navigationItem.largeTitleDisplayMode = .inline
        navigationController.navigationBar.prefersLargeTitles = true

        return navigationController
    }
}
