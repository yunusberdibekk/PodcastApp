//
//  PodcastListDetailBuilder.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 23.04.2024.
//

import Foundation

enum PodcastListDetailBuilder {
    static func make(viewModel: PodcastListDetailViewModelProtocol) -> PodcastListDetailViewController {
        let controller = PodcastListDetailViewController()
        controller.viewModel = viewModel
        return controller
    }
}
