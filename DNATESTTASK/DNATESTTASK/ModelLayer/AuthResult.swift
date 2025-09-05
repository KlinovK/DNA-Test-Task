//
//  AuthResult.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import Foundation

struct AuthResult: Codable {
    let accessToken: String
    let me: UserModel
}
