//
//  PodcastDetailContracts.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 23.04.2024.
//

import Foundation

protocol PodcastDetailViewModelProtocol {
    var delegate: PodcastDetailViewModelDelegate? { get set }

    func viewDidLoad()
    func viewWillAppear()
    func dismiss()
}

protocol PodcastDetailViewModelDelegate: AnyObject {
    func handleViewModelOutput(output: PodcastDetailViewModelOutput)
}

enum PodcastDetailViewModelOutput {
    case setTitle(String)
    case setDescription(String)
    case showPodcastDetail(URL)
}
