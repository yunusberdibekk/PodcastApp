//
//  PodcastListContracts.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 19.04.2024.
//

import Foundation
import PodcastAPI

protocol PodcastListViewModelDelegate: AnyObject, Loadable {
    func handleViewModelOutput(output: PodcastListViewModelOutput)
}

protocol PodcastListViewModelProtocol {
    var delegate: PodcastListViewModelDelegate? { get set }
    var apiClient: APIClientProtocol { get }

    func viewDidLoad()
    func viewWillAppear()
    func didSelectRowAt(at index: Int)
}

enum PodcastListViewModelOutput {
    case setTitle(String)
    case showPodcastList([PodcastPresentation])
}

enum PodcastListRoute {
    case detail
}
