//
//  PodcastListViewModel.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 19.04.2024.
//

import Foundation
import PodcastAPI

final class PodcastListViewModel {
    // MARK: - Variables

    weak var delegate: PodcastListViewModelDelegate?
    var apiClient: APIClientProtocol

    private var title: String?
    private var podcastListModels: [PodcastListModel] = []

    // MARK: - Lifecycle

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    // MARK: - Private Functions

    private func notify(_ output: PodcastListViewModelOutput) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.delegate?.handleViewModelOutput(output: output)
        }
    }
}

// MARK: - PodcastListViewModel + PodcastListViewModelProtocol

extension PodcastListViewModel: PodcastListViewModelProtocol {
    func viewDidLoad() {
        delegate?.loadable(true)

        apiClient.execute(expecting: PodcastListResponse.self, request: .init(url: URLString.podcastList.url)) { [weak self] result in
            guard let self else { return }
            delegate?.loadable(false)

            switch result {
            case .success(let object):
                let presentations = object.feed.results.compactMap { PodcastListPresentation(podcast: $0) }

                self.podcastListModels = object.feed.results
                self.title = object.feed.title
                self.notify(.setTitle(object.feed.title))
                self.notify(.showPodcastList(presentations))
            case .failure(let error):
                dump(error)
            }
        }
    }

    func viewDidDisappear() {
        notify(.setTitle(title))
    }

    func didSelectRowAt(at index: Int) {
        let podcast = podcastListModels[index]
        let viewModel = PodcastListDetailViewModel(podcastDetailPresentation: .init(
            id: podcast.id,
            title: podcast.artistName,
            description: podcast.name,
            urlString: podcast.url))
        let controller = PodcastListDetailBuilder.make(viewModel: viewModel)

        delegate?.push(controller: controller)
    }
}
