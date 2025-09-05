//
//  LoginView.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.opacity(0.1)
                    .ignoresSafeArea()
                
                Image("ic_spiral")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                
                Image("ic_welcome_flower")
                    .resizable()
                    .frame(width: 171, height: 285)
                    .ignoresSafeArea()
                
                VStack {
                    VStack(alignment: .leading, spacing: 30) {
                        Text("Welcome")
                            .font(.system(.largeTitle, design: .default, weight: .bold))
                        
                        Text("Sign in to continue. We will authenticate you securely.")
                            .font(.system(.body, design: .default, weight: .regular))
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.horizontal, 16)
                    
                    Spacer()
                    
                    VStack(spacing: 16) {
                        Button(action: {
                            Task {
                                do {
                                    try await authViewModel.authenticate()
                                } catch {
                                    alertMessage = error.localizedDescription
                                    showAlert = true
                                }
                            }
                        }) {
                            HStack {
                                Image(systemName: "person.circle")
                                    .foregroundColor(.black)
                                Text("Sign In")
                                    .foregroundColor(.black)
                                    .font(.system(.body, design: .default, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                        }
                        .disabled(authViewModel.isLoading)
                        
                        Text("By continuing, you agree to Assetsy’s [Terms of Use]() and [Privacy Policy]()")
                            .font(.system(.caption, design: .default, weight: .regular))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 32)
                    
                    if authViewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .scaleEffect(1.2)
                    }
                }
                .padding(.horizontal, 16)
                .navigationDestination(isPresented: $authViewModel.isAuthenticated) {
                    WelcomeView()
                        .environmentObject(authViewModel)
                }
            }
            .font(.system(.body, design: .default))
            .alert("Authentication Error", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
