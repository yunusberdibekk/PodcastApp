//
//  PodcastDetailViewModel.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 23.04.2024.
//

import Foundation

final class PodcastDetailViewModel: PodcastDetailViewModelProtocol {
    weak var delegate: (any PodcastDetailViewModelDelegate)?
    var detailPresentation: PodcastDetailPresentation

    init(podcastDetailPresentation: PodcastDetailPresentation) {
        self.detailPresentation = podcastDetailPresentation
    }
}

extension PodcastDetailViewModel {
    func viewDidLoad() {
        delegate?.handleViewModelOutput(output: .setTitle(detailPresentation.title))
    }

    func viewWillAppear() {}

    func dismiss() {}
}
