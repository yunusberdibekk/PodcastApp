//
//  AppDelegate.swift
//  PodcastApp
//
//  Created by Yunus Emre Berdibek on 16.04.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        app.router.start()
        return true
    }
}
