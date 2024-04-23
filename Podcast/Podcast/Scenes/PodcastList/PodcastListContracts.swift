//
//  PodcastListContracts.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 19.04.2024.
//

import Foundation
import PodcastAPI

protocol PodcastListViewModelProtocol {
    var delegate: PodcastListViewModelDelegate? { get set }
    var apiClient: APIClientProtocol { get }

    func viewDidLoad()
    func viewWillAppear()
    func didSelectRowAt(at index: Int)
}

protocol PodcastListViewModelDelegate: AnyObject, Loadable, Pushable {
    func handleViewModelOutput(output: PodcastListViewModelOutput)
}

enum PodcastListViewModelOutput {
    case setTitle(String)
    case showPodcastList([PodcastListPresentation])
}
