//
//  AuthRequest.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import Foundation

struct AuthRequest: Codable {
    let jsonrpc: String
    let method: String
    let params: AuthParams
    let id: Int
}
