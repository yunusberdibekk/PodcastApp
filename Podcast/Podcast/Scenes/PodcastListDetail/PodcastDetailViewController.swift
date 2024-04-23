//
//  PodcastDetailViewController.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 23.04.2024.
//

import UIKit

final class PodcastDetailViewController: UIViewController {
    var viewModel: PodcastDetailViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareController()
        viewModel?.delegate = self
        viewModel?.viewDidLoad()
    }

    private func prepareController() {
        view.backgroundColor = .systemBackground

        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

extension PodcastDetailViewController: PodcastDetailViewModelDelegate {
    func handleViewModelOutput(output: PodcastDetailViewModelOutput) {
        switch output {
        case .setTitle(let title):
            self.title = title
        case .setDescription(let description):
            print(description)
        case .showPodcastDetail(let url):
            dump(url)
        }
    }
}
