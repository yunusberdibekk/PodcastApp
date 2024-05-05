//
//  SearchListContracts.swift
//  Podcast
//
//  Created by Yunus Emre Berdibek on 30.04.2024.
//

import Foundation

protocol SearchListViewModelProtocol {
    var delegate: SearchListViewModelDelegate? { get set }
}

protocol SearchListViewModelDelegate: AnyObject {
    func handleViewModelOutput(output: SearchListViewmModelOutput)
}

enum SearchListViewmModelOutput {}
