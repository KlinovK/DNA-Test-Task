//
//  ContentView.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                WelcomeView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            authViewModel.checkAuthenticationStatus()
        }
    }
}

#Preview {
    ContentView()
}
