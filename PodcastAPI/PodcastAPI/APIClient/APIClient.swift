//
//  APIClient.swift
//  PodcastAPI
//
//  Created by Yunus Emre Berdibek on 17.04.2024.
//

import Foundation

public final class APIClient: APIClientProtocol {
    public var session: URLSession {
        URLSession.shared
    }

    public init() {}

    public func execute<T: Codable>(expecting: T.Type, request: URLRequest, completion: @escaping (Result<T, APIClientError>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            guard let data, error == nil else {
                return completion(.failure(.invalidRequest(msg: request.url?.absoluteString ?? "")))
            }

            guard let response = response as? HTTPURLResponse else {
                return completion(.failure(.invalidResponse(msg: response?.description ?? "")))
            }

            guard (200 ... 299).contains(response.statusCode) else {
                return completion(.failure(.invalidStatusCode(code: response.statusCode.description)))
            }

            do {
                let decoder = JSONDecoder()
                let object = try decoder.decode(T.self, from: data)

                completion(.success(object))
            } catch {
                completion(.failure(.invalidDecoding(msg: error.localizedDescription)))
            }
        }

        task.resume()
    }
}
