//
//  PodcastSearchResponse.swift
//  PodcastAPI
//
//  Created by Yunus Emre Berdibek on 22.04.2024.
//

import Foundation

public struct PodcastSearchResponse: Codable {
    public let resultCount: Int
    public let results: [PodcastSearchModel]
}
