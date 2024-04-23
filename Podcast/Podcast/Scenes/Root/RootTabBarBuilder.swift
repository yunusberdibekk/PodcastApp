//
//  RootTabBarBuilder.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 23.04.2024.
//

import UIKit

enum RootTabBarBuilder {
    static func start() -> RootTabBarController {
        let conroller = RootTabBarController(apiClient: app.client)
        return conroller
    }
}
