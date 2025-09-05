//
//  FirebaseManager.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import Foundation
import FirebaseCore

class FirebaseManager {
    static let shared = FirebaseManager()
    
    private init() {}
    
    func configure() {
        FirebaseApp.configure()
    }
}
