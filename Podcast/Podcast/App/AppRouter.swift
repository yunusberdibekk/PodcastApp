//
//  AppRouter.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 17.04.2024.
//

import UIKit

final class AppRouter {
    var window: UIWindow?

    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()

        navAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.purple,
        ]

        navAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.purple,
        ]

        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance

        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithOpaqueBackground()

        UITabBar.appearance().standardAppearance = tabAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabAppearance
    }

    func start() {
        let controller = RootTabBarBuilder.start()
        window?.backgroundColor = UIColor.systemBackground
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
