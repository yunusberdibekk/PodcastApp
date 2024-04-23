//
//  PodcastListViewModel.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 19.04.2024.
//

import Foundation
import PodcastAPI

final class PodcastListViewModel: PodcastListViewModelProtocol {
    weak var delegate: PodcastListViewModelDelegate?
    var apiClient: APIClientProtocol

    private var podcastListModels: [PodcastListModel] = []

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    private func notify(_ output: PodcastListViewModelOutput) {
        DispatchQueue.main.async {
            self.delegate?.handleViewModelOutput(output: output)
        }
    }
}

extension PodcastListViewModel {
    func viewDidLoad() {
        notify(.setTitle("Top Shows"))
        delegate?.loadable(true)

        let url = URL(string: "https://rss.applemarketingtools.com/api/v2/tr/podcasts/top/50/podcasts.json")!

        apiClient.execute(expecting: PodcastListResponse.self, request: .init(url: url)) { [weak self] result in
            guard let self else {
                return
            }

            delegate?.loadable(false)

            switch result {
            case .success(let object):
                let presentations = object.feed.results.compactMap { PodcastListPresentation(podcast: $0) }

                self.podcastListModels = object.feed.results
                self.notify(.showPodcastList(presentations))
            case .failure(let error):
                dump(error)
            }
        }
    }

    func viewWillAppear() {}

    func didSelectRowAt(at index: Int) {
        let podcast = podcastListModels[index]
        let viewModel = PodcastDetailViewModel(podcastDetailPresentation: .init(title: podcast.artistName,
                                                                                description: podcast.name,
                                                                                urlString: podcast.url,
                                                                                detailType: .podcastList(podcast.id)))
        let controller = PodcastDetailBuilder.make(viewModel: viewModel)

        delegate?.push(controller: controller)
    }
}
