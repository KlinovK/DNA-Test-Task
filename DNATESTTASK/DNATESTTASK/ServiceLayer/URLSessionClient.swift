//
//  URLSessionClient.swift
//  DNATESTTASK
//
//  Created by Константин Клинов on 05/09/25.
//

import Foundation

protocol NetworkClient {
    func request(_ urlRequest: URLRequest) async throws -> Data
}

class URLSessionClient: NetworkClient {
    func request(_ urlRequest: URLRequest) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw AuthError.serverError("HTTP Error")
        }
        
        return data
    }
}
