//
//  AuthError.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import Foundation

enum AuthError: LocalizedError {
    case invalidCredentials
    case noViewController
    case configurationError
    case noIdToken
    case networkError
    case serverError(String)
    case noUserLoggedIn
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Недействительные учетные данные"
        case .noViewController:
            return "Не удалось найти контроллер представления"
        case .configurationError:
            return "Ошибка конфигурации"
        case .noIdToken:
            return "Не удалось получить ID токен"
        case .networkError:
            return "Ошибка сети"
        case .serverError(let message):
            return "Ошибка сервера: \(message)"
        case .noUserLoggedIn:
            return "Пользователь не авторизован"
        }
    }
}
