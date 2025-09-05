//
//  DNATESTTASKApp.swift
//  DNATESTTASK
//
//  Created by Константин Клинов on 04/09/25.
//

import SwiftUI

@main
struct DNATESTTASKApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
