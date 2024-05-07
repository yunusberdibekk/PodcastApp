//
//  SearchListViewModel.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 30.04.2024.
//

import Foundation
import PodcastAPI

final class SearchListViewModel {
    // MARK: - Variables

    weak var delegate: SearchListViewModelDelegate?
    var apiClient: APIClientProtocol

    private var title: String?
    private var searchListModels: [PodcastSearchModel] = []

    // MARK: - Lifecycle

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    private func notify(_ output: SearchListViewmModelOutput) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.delegate?.handleViewModelOutput(output: output)
        }
    }
}

// MARK: - ViewModel + SearchListViewModelProtocol

extension SearchListViewModel: SearchListViewModelProtocol {
    func viewDidLoad() {}

    func viewDidDissapear() {}

    func didSelectRowAt(at index: Int) {}
}
