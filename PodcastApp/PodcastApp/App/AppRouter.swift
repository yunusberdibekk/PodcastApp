//
//  AppRouter.swift
//  PodcastApp
//
//  Created by Yunus Emre Berdibek on 16.04.2024.
//

import UIKit

final class AppRouter {
    var window: UIWindow?

    init() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
    }

    func start() {
        let controller = RootTabBarController()
        window?.backgroundColor = UIColor.systemBackground
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
