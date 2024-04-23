//
//  RootTabBarController.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 16.04.2024.
//

import PodcastAPI
import UIKit

final class RootTabBarController: UITabBarController {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
        super.init(nibName: nil, bundle: nil)
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
        let podcastListViewModel = PodcastListViewModel(apiClient: apiClient)
        let podcastListViewController = PodcastListViewController()
        podcastListViewController.viewModel = podcastListViewModel

        let searchListViewController = SearchListViewController()
        let favoritesListViewController = FavoritesListViewController()

        return [
            createController(controller: podcastListViewController,
                             title: "Podcasts",
                             image: .house,
                             tag: 0),

            createController(controller: searchListViewController,
                             title: "Search",
                             image: .magnifyingglass,
                             tag: 1),

            createController(controller: favoritesListViewController,
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

        navigationController.navigationItem.largeTitleDisplayMode = .automatic
        navigationController.navigationBar.prefersLargeTitles = true

        return navigationController
    }
}
