//
//  AuthViewModel.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import SwiftUI
import FirebaseAuth

@MainActor
class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var currentUser: UserModel?
    
    private let apiService = APIService()
    private let tokenManager = TokenManager()
    
    init() {
        checkAuthenticationStatus()
    }
    
    private func fetchFirebaseIdToken() async throws -> String {
        isLoading = true
        defer { isLoading = false }
        
        guard let user = Auth.auth().currentUser else {
            throw AuthError.noUserLoggedIn
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            user.getIDToken { idToken, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let idToken = idToken else {
                    continuation.resume(throwing: AuthError.noIdToken)
                    return
                }
                continuation.resume(returning: idToken)
            }

        }
    }
    
    private func authenticateWithFirebaseIdToken(_ idToken: String) async throws {
        isLoading = true
        defer { isLoading = false }
        
        let response = try await apiService.authenticateWithFirebase(idToken: idToken)
        tokenManager.saveToken(response.result.accessToken)
        tokenManager.saveUser(response.result.me)
        currentUser = response.result.me
        isAuthenticated = true
    }
    
    public func authenticate() async throws {
        let idToken = try await fetchFirebaseIdToken()
        try await authenticateWithFirebaseIdToken(idToken)
    }
    
    public func signOut() {
        do {
            try Auth.auth().signOut()
            tokenManager.clearToken()
            tokenManager.clearUser()
            isAuthenticated = false
            currentUser = nil
        } catch {
            print("Sign out error: \(error.localizedDescription)")
        }
    }
    
    public func checkAuthenticationStatus() {
        if tokenManager.hasValidToken() {
            isAuthenticated = true
            currentUser = tokenManager.getCurrentUser()
        } else {
            isAuthenticated = false
            currentUser = nil
        }
    }
}
