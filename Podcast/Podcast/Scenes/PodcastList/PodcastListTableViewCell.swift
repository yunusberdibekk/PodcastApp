//
//  PodcastListTableViewCell.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 20.04.2024.
//

import SDWebImage
import UIKit

final class PodcastListTableViewCell: UITableViewCell {
    static let reuseIdentifier: String = "PodcastListTableViewCell"

    private let podcastImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func prepareCell() {
        accessoryType = .disclosureIndicator
        backgroundColor = .systemBackground
        preparePodcastImage()
    }

    private func preparePodcastImage() {
        addSubview(podcastImage)

        NSLayoutConstraint.activate([
            podcastImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            podcastImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            podcastImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            podcastImage.widthAnchor.constraint(equalToConstant: frame.width * 0.3)
        ])

        podcastImage.clipsToBounds = true
        podcastImage.layer.cornerRadius = 12
    }
}

extension PodcastListTableViewCell {
    public func configure(with presentation: PodcastPresentation) {
        podcastImage.sd_setImage(with: .init(string: presentation.image))
    }
}
