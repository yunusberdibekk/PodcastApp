//
//  URLString.swift
//  PodcastAPI
//
//  Created by Yunus Emre Berdibek on 23.04.2024.
//

import Foundation

public enum URLString: String {
    case podcastList = "https://rss.applemarketingtools.com/api/v2/tr/podcasts/top/50/podcasts.json"

    public var url: URL {
        return URL(string: self.rawValue)!
    }
}
