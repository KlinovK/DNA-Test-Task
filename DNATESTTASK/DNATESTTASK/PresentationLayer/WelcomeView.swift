//
//  WelcomeView.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.1, green: 0.1, blue: 0.2),
                        Color(red: 0.05, green: 0.05, blue: 0.15)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Welcome Header
                    VStack(spacing: 16) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.white)
                        
                        Text("Добро пожаловать!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        if let userName = authViewModel.currentUser?.name {
                            Text("Привет, \(userName)")
                                .font(.title2)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Информация о пользователе")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        if let user = authViewModel.currentUser {
                            HStack {
                                Text("ID:")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text("\(user.id)")
                                    .foregroundColor(.white)
                            }
                            
                            HStack {
                                Text("Имя:")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text(user.name)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(20)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(16)
                    
                    Spacer()
                    
                    // Sign Out Button
                    Button(action: {
                        authViewModel.signOut()
                    }) {
                        Text("Выйти")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.red.opacity(0.8))
                            .cornerRadius(25)
                    }
                }
                .padding(.horizontal, 32)
            }
            .navigationBarHidden(true)
        }
    }
}
