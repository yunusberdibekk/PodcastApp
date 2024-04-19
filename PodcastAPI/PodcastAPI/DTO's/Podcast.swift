//
//  Podcast.swift
//  PodcastAPI
//
//  Created by Yunus Emre Berdibek on 19.04.2024.
//

import Foundation

public struct Feed: Codable {
    public let title: String
    public let country: String
    public let results: [Podcast]
}

public struct Podcast: Identifiable, Codable {
    public let id: String
    public let artistName, name: String
    public let kind: Kind
    public let artworkUrl100: String
    public let genres: [Genre]
    public let url: String
    public let contentAdvisoryRating: String?
}

public struct Genre: Codable {
    public let genreID, name: String
    public let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

public enum Kind: String, Codable {
    case podcasts
}
