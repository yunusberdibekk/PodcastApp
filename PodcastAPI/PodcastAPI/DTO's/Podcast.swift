//
//  Podcast.swift
//  PodcastAPI
//
//  Created by Yunus Emre Berdibek on 19.04.2024.
//

import Foundation

public struct Feed: Codable {
    let title: String
    let country: String
    let results: [Podcast]
}

public struct Podcast: Codable {
    let artistName, id, name: String
    let kind: Kind
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    let contentAdvisoryRating: String?
}

public struct Genre: Codable {
    let genreID, name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

public enum Kind: String, Codable {
    case podcasts
}
