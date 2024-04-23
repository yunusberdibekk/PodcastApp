//
//  PodcastListDetailContracts.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 23.04.2024.
//

import Foundation

protocol PodcastListDetailViewModelProtocol {
    var delegate: PodcastListDetailViewModelDelegate? { get set }

    func viewDidLoad()
    func viewWillAppear()
    func dismiss()
}

protocol PodcastListDetailViewModelDelegate: AnyObject, Loadable {
    func handleViewModelOutput(output: PodcastListDetailViewModelOutput)
}

enum PodcastListDetailViewModelOutput {
    case setURL(URL?)
}
