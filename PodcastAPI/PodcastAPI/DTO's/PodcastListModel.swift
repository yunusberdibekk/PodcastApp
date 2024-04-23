//
//  Podcast.swift
//  PodcastAPI
//
//  Created by Yunus Emre Berdibek on 19.04.2024.
//

import Foundation

public struct Feed: Codable {
    public let title: String
    public let results: [PodcastListModel]
}

public struct PodcastListModel: Identifiable, Codable {
    public let id: String
    public let artistName, name: String
    public let artworkUrl100: String
    public let url: String
}
