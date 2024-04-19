//
//  APIClientContracts.swift
//  PodcastAPI
//
//  Created by Yunus Emre Berdibek on 17.04.2024.
//

import Foundation

public protocol APIClientProtocol {
    var session: URLSession { get }

    func execute<T: Codable>(
        expecting: T.Type,
        request: URLRequest,
        completion: @escaping (Result<T, APIClientError>) -> Void
    )
}

public enum APIClientError: Error {
    case invalidRequest(msg: String)
    case invalidResponse(msg: String)
    case invalidStatusCode(code: String)
    case invalidDecoding(msg: String)

    var description: String {
        switch self {
        case .invalidRequest(let msg):
            "@PodcastAPI: Network Request Error: \(msg)"
        case .invalidResponse(let msg):
            "@PodcastAPI: Invalid Response or No HTTP Response Error: \(msg)"
        case .invalidStatusCode(let code):
            "@PodcastAPI: Invalid HTTP Status Code: \(code)"
        case .invalidDecoding(let msg):
            "@PodcastAPI: JSON Decoding Error: \(msg)"
        }
    }
}

public enum APIClientRequest {}
