//
//  SearchListContracts.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 30.04.2024.
//

import Foundation
import PodcastAPI

protocol SearchListViewModelProtocol {
    var delegate: SearchListViewModelDelegate? { get set }
    var apiClient: APIClientProtocol { get }

    func viewDidLoad()
    func viewDidDissapear()
    func didSelectRowAt(at index: Int)
}

protocol SearchListViewModelDelegate: AnyObject, Loadable, Pushable {
    func handleViewModelOutput(output: SearchListViewmModelOutput)
}

enum SearchListViewmModelOutput {
    case setTitle(String)
    case showSearchList([SearchListPresentation])
}
