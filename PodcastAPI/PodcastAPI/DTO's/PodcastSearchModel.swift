//
//  PodcastSearchModel.swift
//  PodcastAPI
//
//  Created by Yunus Emre Berdibek on 22.04.2024.
//

import Foundation

public struct PodcastSearchModel: Codable {
    public let collectionID, trackID: Int
    public let artistName, collectionName, trackName, collectionCensoredName: String
    public let trackCensoredName: String
    public let collectionViewURL: String
    public let feedURL: String
    public let trackViewURL: String
    public let artworkUrl30, artworkUrl60, artworkUrl100: String
    public let releaseDate: Date
    public let trackCount: Int
    public let trackTimeMillis: Int?
    public let primaryGenreName: String
    public let artworkUrl600: String
    public let genreIDS, genres: [String]

    enum CodingKeys: String, CodingKey {
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case collectionViewURL = "collectionViewUrl"
        case feedURL = "feedUrl"
        case trackViewURL = "trackViewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, artworkUrl600
        case releaseDate, trackCount, trackTimeMillis, primaryGenreName
        case genreIDS = "genreIds"
        case genres
    }
}
