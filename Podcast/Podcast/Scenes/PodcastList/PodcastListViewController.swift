//
//  ViewController.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 16.04.2024.
//

import PodcastAPI
import UIKit

final class PodcastListViewController: LoadableViewController {
    var viewModel: PodcastListViewModelProtocol

    private var podcastPresentations: [PodcastPresentation] = []

    init(viewModel: PodcastListViewModelProtocol) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        viewModel.delegate = self
        viewModel.viewDidLoad()
    }
}

extension PodcastListViewController: PodcastListViewModelDelegate {
    func handleViewModelOutput(output: PodcastListViewModelOutput) {
        switch output {
        case .setTitle(let title):
            self.title = title
        case .showPodcastList(let presentations):
            self.podcastPresentations = presentations
            dump(presentations)
        }
    }
}
