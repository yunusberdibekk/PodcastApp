//
//  PodcastDetailPresentation.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 23.04.2024.
//

import Foundation

enum PodcastDetailPresentationType {
    case podcastList(String) // id
    case podcastSearch(String) // trackID
}

struct PodcastDetailPresentation {
    let title: String
    let description: String
    let urlString: String
    let detailType: PodcastDetailPresentationType
}
