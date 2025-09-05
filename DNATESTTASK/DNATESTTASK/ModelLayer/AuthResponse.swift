//
//  AuthResponse.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import Foundation

struct AuthResponse: Codable {
    let jsonrpc: String
    let result: AuthResult
    let id: Int
}
