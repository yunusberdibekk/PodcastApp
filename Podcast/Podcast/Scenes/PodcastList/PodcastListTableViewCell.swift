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

    // MARK: - UI Components

    private let podcastTitle: TitleLabel = .init(text: "", numberOfLines: 2)
    private let podcastDescription: BodyLabel = .init(text: "")

    private let podcastLabelStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally

        return stackView
    }()

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
        preparePodcastLabelsStack()
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

    private func preparePodcastLabelsStack() {
        addSubview(podcastLabelStack)
        podcastLabelStack.addArrangedSubview(podcastTitle)
        podcastLabelStack.addArrangedSubview(podcastDescription)

        NSLayoutConstraint.activate([
            podcastLabelStack.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            podcastLabelStack.leadingAnchor.constraint(equalTo: podcastImage.trailingAnchor, constant: 16),
            podcastLabelStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            podcastLabelStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}

extension PodcastListTableViewCell {
    public func configure(with presentation: PodcastListPresentation) {
        podcastTitle.text = presentation.title
        podcastDescription.text = presentation.description
        podcastImage.sd_setImage(with: .init(string: presentation.image))
    }
}
