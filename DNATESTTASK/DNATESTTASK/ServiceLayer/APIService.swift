//
//  APIService.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import Foundation

class APIService {
    
    private let baseURL = "https://api.court360.ai/rpc/client"
    
    func authenticateWithFirebase(idToken: String) async throws -> AuthResponse {
        guard let url = URL(string: baseURL) else {
            throw AuthError.networkError
        }
        
        let request = AuthRequest(
            jsonrpc: "2.0",
            method: "auth.firebaseLogin",
            params: AuthParams(fbIdToken: idToken),
            id: 1
        )
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            urlRequest.httpBody = try JSONEncoder().encode(request)
        } catch {
            throw AuthError.networkError
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw AuthError.serverError("HTTP Error")
            }
            let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
            return authResponse
        } catch let error as DecodingError {
            throw AuthError.serverError("Decoding error: \(error.localizedDescription)")
        } catch {
            throw AuthError.networkError
        }
    }
}
