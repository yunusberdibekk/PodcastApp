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
        viewControllers = prepareControllers()
    }

    private func prepareControllers() -> [UIViewController] {
        return [
            createController(controller: PodcastListViewController(),
                             title: "Podcasts",
                             image: .music_note_house),

            createController(controller: SearchViewController(),
                             title: "Search",
                             image: .magnifyingglass_circle),

            createController(controller: FavoritesListViewController(),
                             title: "Favorites",
                             image: .heart)
        ]
    }

    private func createController(controller: UIViewController, title: String, image: SFSymbol) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: controller)

        navigationController.tabBarItem = UITabBarItem(title: title,
                                                       image: UIImage(systemName: image.systemName),
                                                       selectedImage: UIImage(systemName: image.fill))

        navigationController.navigationItem.largeTitleDisplayMode = .inline
        navigationController.navigationBar.prefersLargeTitles = true

        return navigationController
    }
}
