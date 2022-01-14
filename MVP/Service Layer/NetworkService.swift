//
//  NetworkService.swift
//  MVP
//
//  Created by Zhanibek Lukpanov on 29.12.2021.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let comments = try JSONDecoder().decode([Comment].self, from: data)
                completion(.success(comments))
            } catch {
                completion(.failure(error))
            }

        }.resume()
    }
}
