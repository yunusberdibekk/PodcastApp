//
//  PodcastDetailBuilder.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 23.04.2024.
//

import Foundation

enum PodcastDetailBuilder {
    static func make(viewModel: PodcastDetailViewModelProtocol) -> PodcastDetailViewController {
        let controller = PodcastDetailViewController()
        controller.viewModel = viewModel
        return controller
    }
}
