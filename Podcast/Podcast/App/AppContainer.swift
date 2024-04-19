//
//  AppContainer.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 17.04.2024.
//

import Foundation
import PodcastAPI

let app: AppContainer = .init()

final class AppContainer {
    let router: AppRouter = .init()
    let client: APIClientProtocol = APIClient()
}
