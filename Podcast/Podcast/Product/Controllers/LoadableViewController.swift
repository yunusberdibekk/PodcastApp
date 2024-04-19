//
//  LoadableViewController.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 20.04.2024.
//

import UIKit

class LoadableViewController: UIViewController {
    var container: UIView!

    func startAnimating() {
        container = UIView(frame: view.bounds)
        view.addSubview(container)
        container.backgroundColor = .systemBackground
        container.alpha = 0

        UIView.animate(withDuration: 0.25) {
            self.container.alpha = 0.75
        }

        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])

        activityIndicator.startAnimating()
    }

    func stopAnimating() {
        DispatchQueue.main.async {
            self.container.removeFromSuperview()
            self.container = nil
        }
    }
}
