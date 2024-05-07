//
//  SearchListPresentation.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 30.04.2024.
//

import Foundation
import PodcastAPI

final class SearchListPresentation {
    let image: String
    let title: String
    let description: String
    let count: Int

    init(image: String, title: String, description: String, count: Int) {
        self.image = image
        self.title = title
        self.description = description
        self.count = count
    }

    convenience init(podcast: PodcastSearchModel) {
        self.init(image: podcast.artworkUrl60, title: podcast.trackName, description: podcast.artistName,
                  count: podcast.trackCount)
    }
}
