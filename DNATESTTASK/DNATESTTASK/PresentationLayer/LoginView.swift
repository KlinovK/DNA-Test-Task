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
                Color("main_background")
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
                    VStack(alignment: .leading, spacing: 20) {
                        Text("WELCOME")
                            .font(.custom("SF Pro", size: 34))
                            .fontWeight(.bold)
                            .foregroundColor(Color("main_text_color"))
                        
                        Text("Enter your phone number. We will send you an SMS with a confirmation code to this number.")
                            .font(.custom("SF Pro", size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(Color("subtitle_text_color"))
                            .multilineTextAlignment(.leading)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 8) {
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
                                Image(systemName: "apple.logo")
                                    .foregroundColor(Color("main_text_color"))
                                Text("Continue with Apple")
                                    .font(.custom("SF Pro", size: 17))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("main_text_color"))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .disabled(authViewModel.isLoading)
                        
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
                                Image(systemName: "globe")
                                    .foregroundColor(Color("main_text_color"))
                                Text("Continue with Apple")
                                    .font(.custom("SF Pro", size: 17))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("main_text_color"))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                        .disabled(authViewModel.isLoading)
                        
                        Text(attributedString)
                            .font(.custom("SF Pro", size: 11))
                            .fontWeight(.bold)
                            .foregroundColor(Color("subtitle_text_color"))
                            .multilineTextAlignment(.center)
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
    
    private var attributedString: AttributedString {
        let markdownText = "By continuing, you agree to Assetsy’s [Terms of Use](terms) and [Privacy Policy](privacy)"
        return try! AttributedString(markdown: markdownText)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
