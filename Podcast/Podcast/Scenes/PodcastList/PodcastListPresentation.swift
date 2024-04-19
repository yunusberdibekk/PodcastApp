//
//  PodcastPresentation.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 19.04.2024.
//

import Foundation
import PodcastAPI

final class PodcastPresentation {
    let image: String
    let title: String
    let description: String

    init(image: String, title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
}

extension PodcastPresentation {
    convenience init(podcast: Podcast) {
        self.init(image: podcast.artworkUrl100, title: podcast.artistName, description: podcast.name)
    }
}
