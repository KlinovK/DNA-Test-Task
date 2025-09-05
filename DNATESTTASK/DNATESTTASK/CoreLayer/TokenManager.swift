//
//  TokenManager.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import Foundation
import Security

class TokenManager {
    
   private let tokenKey = "access_token"
   private let userKey = "current_user"
   
   func saveToken(_ token: String) {
       saveToKeychain(key: tokenKey, data: token.data(using: .utf8)!)
   }
   
   func getToken() -> String? {
       guard let data = getFromKeychain(key: tokenKey),
             let token = String(data: data, encoding: .utf8) else {
           return nil
       }
       return token
   }
   
   func clearToken() {
       deleteFromKeychain(key: tokenKey)
   }
   
   func saveUser(_ user: UserModel) {
       do {
           let userData = try JSONEncoder().encode(user)
           saveToKeychain(key: userKey, data: userData)
       } catch {
           print("Failed to save user: \(error)")
       }
   }
   
   func getCurrentUser() -> UserModel? {
       guard let data = getFromKeychain(key: userKey) else {
           return nil
       }
       
       do {
           return try JSONDecoder().decode(UserModel.self, from: data)
       } catch {
           print("Failed to decode user: \(error)")
           return nil
       }
   }
   
   func clearUser() {
       deleteFromKeychain(key: userKey)
   }
   
   func hasValidToken() -> Bool {
       return getToken() != nil
   }
   
   // MARK: - Keychain Methods
   private func saveToKeychain(key: String, data: Data) {
       let query: [String: Any] = [
           kSecClass as String: kSecClassGenericPassword,
           kSecAttrAccount as String: key,
           kSecValueData as String: data
       ]
       
       SecItemDelete(query as CFDictionary)
       SecItemAdd(query as CFDictionary, nil)
   }
   
   private func getFromKeychain(key: String) -> Data? {
       let query: [String: Any] = [
           kSecClass as String: kSecClassGenericPassword,
           kSecAttrAccount as String: key,
           kSecReturnData as String: kCFBooleanTrue!,
           kSecMatchLimit as String: kSecMatchLimitOne
       ]
       
       var dataTypeRef: AnyObject?
       let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
       
       if status == noErr {
           return dataTypeRef as? Data
       } else {
           return nil
       }
   }
   
   private func deleteFromKeychain(key: String) {
       let query: [String: Any] = [
           kSecClass as String: kSecClassGenericPassword,
           kSecAttrAccount as String: key
       ]
       
       SecItemDelete(query as CFDictionary)
   }
}
