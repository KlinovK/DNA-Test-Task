//
//  AppDelegate.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import Foundation
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseManager.shared.configure()
        return true
    }
}
