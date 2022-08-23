//
//  NetworkWorker.swift
//  PryanikiTestApp
//
//  Created by Stanislav Lezovsky on 23.08.2022.
//

import Foundation

enum InternalError: Error {
    case connectionError
    case decodeError
}

final class NetworkWorker {
    let session: URLSession
    init (session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }

    func fetch(completion: @escaping(Result<Welcome, InternalError>) -> Void) {
        guard let url = createURLComponents() else { return }
        let task = session.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(.connectionError))
            }
            guard let data = data,
                  let result = try? JSONDecoder().decode(Welcome.self, from: data)
            else {
                completion(.failure(.decodeError))
                return
            }
            completion(.success(result))
        }
        task.resume()
    }

    private func createURLComponents() -> URL? {
        var url = URLComponents()
        url.scheme = "https"
        url.host = "pryaniky.com"
        url.path = "/static/json/sample.json"
        return url.url
    }
}
