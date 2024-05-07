//
//  ViewController.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 16.04.2024.
//

import PodcastAPI
import UIKit

final class PodcastListViewController: LoadableViewController {
    // MARK: - Variables

    var viewModel: PodcastListViewModelProtocol?
    private var podcastPresentations: [PodcastListPresentation] = []

    // MARK: - UI Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 125
        tableView.register(PodcastListTableViewCell.self,
                           forCellReuseIdentifier: PodcastListTableViewCell.reuseIdentifier)
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareController()
        viewModel?.delegate = self
        viewModel?.viewDidLoad()
    }

    override func viewDidDisappear(_ animated: Bool) {
        viewModel?.viewDidDisappear()
    }

    // MARK: - Private Functions

    private func prepareController() {
        view.backgroundColor = .systemBackground
        prepareTableView()
    }

    private func prepareTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: PodcastListViewController + PodcastListViewModelDelegate

extension PodcastListViewController: PodcastListViewModelDelegate {
    func handleViewModelOutput(output: PodcastListViewModelOutput) {
        switch output {
        case .setTitle(let title):
            navigationItem.title = title
        case .showPodcastList(let presentations):
            podcastPresentations = presentations
            tableView.reloadData()
        }
    }
}

// MARK: - PodcastListViewController + UITableViewDelegate

extension PodcastListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PodcastListTableViewCell.reuseIdentifier,
            for: indexPath) as? PodcastListTableViewCell
        else {
            fatalError()
        }

        cell.configure(with: podcastPresentations[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.didSelectRowAt(at: indexPath.row)
    }
}

// MARK: - PodcastListViewController + UITableViewDataSource

extension PodcastListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        podcastPresentations.count
    }
}
