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
    }

    func start() {
        let controller = RootTabBarController()
        window?.backgroundColor = UIColor.systemBackground
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
