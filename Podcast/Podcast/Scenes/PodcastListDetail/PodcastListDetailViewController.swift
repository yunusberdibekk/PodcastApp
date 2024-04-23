//
//  PodcastListDetailViewController.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 23.04.2024.
//

import UIKit
import WebKit

final class PodcastListDetailViewController: LoadableViewController {
    // MARK: Variables

    var viewModel: PodcastListDetailViewModelProtocol?

    // MARK: - UI Components

    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isHidden = true
        webView.alpha = 0
        return webView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareController()
        viewModel?.delegate = self
        viewModel?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"),
                                                            style: .done,
                                                            target: nil,
                                                            action: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Functions

    private func prepareController() {
        view.backgroundColor = .systemBackground
        prepareWebView()
    }

    private func prepareWebView() {
        view.addSubview(webView)

        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setUpWebView(url: URL?) {
        guard let url else { return }
        webView.load(.init(url: url))

        UIView.animate(withDuration: 0.25) {
            self.webView.isHidden = false
            self.webView.alpha = 1
        }
    }
}

// MARK: - Extensions

extension PodcastListDetailViewController: PodcastListDetailViewModelDelegate {
    func handleViewModelOutput(output: PodcastListDetailViewModelOutput) {
        switch output {
        case .setURL(let url):
            setUpWebView(url: url)
        }
    }
}
