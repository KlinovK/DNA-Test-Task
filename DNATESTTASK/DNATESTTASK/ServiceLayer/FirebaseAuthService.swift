//
//  FirebaseAuthService.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import Foundation

protocol AuthService {
    func authenticate(idToken: String) async throws -> AuthResponse
}

class FirebaseAuthService: AuthService {
    private let networkClient: NetworkClient
    private let baseURL: String
    
    init(networkClient: NetworkClient, baseURL: String = "https://api.court360.ai/rpc/client") {
        self.networkClient = networkClient
        self.baseURL = baseURL
    }
    
    func authenticate(idToken: String) async throws -> AuthResponse {
        let request = try buildRequest(idToken: idToken)
        let data = try await networkClient.request(request)
        return try parseResponse(data)
    }
    
    private func buildRequest(idToken: String) throws -> URLRequest {
        guard let url = URL(string: baseURL) else {
            throw AuthError.networkError
        }
        
        let authRequest = AuthRequest(
            jsonrpc: "2.0",
            method: "auth.firebaseLogin",
            params: AuthParams(fbIdToken: idToken),
            id: 1
        )
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            urlRequest.httpBody = try JSONEncoder().encode(authRequest)
        } catch {
            throw AuthError.networkError
        }
        
        return urlRequest
    }
    
    private func parseResponse(_ data: Data) throws -> AuthResponse {
        do {
            return try JSONDecoder().decode(AuthResponse.self, from: data)
        } catch {
            throw AuthError.serverError("Decoding error: \(error.localizedDescription)")
        }
    }
}

