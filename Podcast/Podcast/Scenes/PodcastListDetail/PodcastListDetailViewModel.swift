//
//  PodcastListDetailViewModel.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 23.04.2024.
//

import Foundation

final class PodcastListDetailViewModel: PodcastListDetailViewModelProtocol {
    weak var delegate: (any PodcastListDetailViewModelDelegate)?
    var detailPresentation: PodcastListDetailPresentation

    init(podcastDetailPresentation: PodcastListDetailPresentation) {
        self.detailPresentation = podcastDetailPresentation
    }

    private func notify(output: PodcastListDetailViewModelOutput) {
        delegate?.handleViewModelOutput(output: output)
    }
}

extension PodcastListDetailViewModel {
    func viewDidLoad() {
        delegate?.loadable(true)
        notify(output: .setURL(URL(string: detailPresentation.urlString)))

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
            self?.delegate?.loadable(false)
        }
    }

    func viewWillAppear() {}

    func dismiss() {}
}
