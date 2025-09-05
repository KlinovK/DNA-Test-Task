//
//  WelcomeView.swift
//  DNATEST
//
//  Created by Константин Клинов on 04/09/25.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    init() {
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().barTintColor = .white
    }
    
    private let columns = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6)
    ]
    
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                         Color("main_background")
                             .ignoresSafeArea()
                         
                         VStack(spacing: 12) {
                             HStack {
                                 Spacer()
                                 
                                 HStack(spacing: 8) {
                                     Text("Deliver to")
                                         .font(.custom("SF Pro", size: 14))
                                         .fontWeight(.medium)
                                         .foregroundColor(Color("main_text_color"))
                                     Image("ic_country")
                                         .resizable()
                                         .scaledToFit()
                                         .frame(width: 32, height: 22)
                                 }
                                 
                                 Menu {
                                     Button("USD") {
                                     }
                                 } label: {
                                     HStack(spacing: 4) {
                                         Text("USD")
                                             .font(.custom("SF Pro", size: 14))
                                             .fontWeight(.medium)
                                         Image(systemName: "chevron.down")
                                             .font(.system(size: 14))
                                     }
                                     .foregroundColor(Color("main_text_color"))
                                     .padding(.horizontal, 12)
                                     .padding(.vertical, 6)
                                 }
                             }
                             
                             HStack {
                                 Text("GIFTS")
                                     .font(.custom("SF Pro", size: 34))
                                     .fontWeight(.bold)
                                     .foregroundColor(Color("main_text_color"))
                                 
                                 Spacer()
                                 
                                 ZStack(alignment: .leading) {
                                     Image(systemName: "magnifyingglass")
                                         .foregroundColor(.gray)
                                         .padding(.leading, 12)
                                     
                                     TextField("Search", text: .constant(""))
                                         .font(.custom("SF Pro", size: 16))
                                         .foregroundColor(Color("main_text_color"))
                                         .padding(.horizontal, 32)
                                         .padding(.vertical, 8)
                                 }
                                 .background(Color.white)
                                 .cornerRadius(16)
                                 .frame(maxWidth: 120)
                             }
                             
                    
                             ScrollView(.horizontal, showsIndicators: false) {
                                 HStack(spacing: 5) {
                                     ForEach(0..<5) { index in
                                         Image("ic_first_collection_view_placeholder")
                                             .scaledToFit()
                                             .frame(width: UIScreen.main.bounds.width - 64, height: 150)
                                             .cornerRadius(16)

                                     }
                                 }
                             }
                             
                             ScrollView(.horizontal, showsIndicators: false) {
                                 HStack(spacing: 10) {
                                     ForEach(0..<3) { index in
                                         Image("ic_second_collection_view_placeholder")
                                             .frame(width: 80, height: 80)
                                             .cornerRadius(16)

                                     }
                                     RoundedRectangle(cornerRadius: 12)
                                         .fill(Color("main_background"))
                                         .frame(width: 80, height: 80)
                                         .overlay(
                                             Text("Show All")
                                                 .foregroundColor(Color("main_text_color"))
                                                 .font(.custom("SF Pro", size: 14))
                                         )
                                 }
                             }
                             
                    
                             VStack(spacing: 16) {
                                     Button(action: {}) {
                                         Text("View all categories")
                                             .font(.custom("SF Pro", size: 14))
                                             .fontWeight(.bold)
                                             .foregroundColor(Color("main_text_color"))
                                             .padding()
                                             .frame(maxWidth: 160, maxHeight: 32)
                                             .background(Color.clear)
                                             .clipShape(RoundedRectangle(cornerRadius: 12))
                                             .overlay(
                                                 RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color.gray, lineWidth: 1)
                                             )
                                     }
                                     HStack {
                                         RoundedRectangle(cornerRadius: 12)
                                             .fill(Color.gray.opacity(0.2))
                                             .frame(height: 32)
                                             .overlay(
                                                HStack(spacing: 4) {
                                                    Text("Giftboxes")
                                                        .font(.custom("SF Pro", size: 14))
                                                        .fontWeight(.medium)
                                                    Image(systemName: "chevron.down")
                                                        .font(.system(size: 14))
                                                }
                                                .foregroundColor(Color("main_text_color"))
                                                .padding(.horizontal, 12)
                                                .padding(.vertical, 6)
                                             )
                                         RoundedRectangle(cornerRadius: 12)
                                             .fill(Color.gray.opacity(0.2))
                                             .frame(height: 32)
                                             .overlay(
                                                HStack(spacing: 4) {
                                                    Text("For her")
                                                        .font(.custom("SF Pro", size: 14))
                                                        .fontWeight(.medium)
                                                    Image(systemName: "chevron.down")
                                                        .font(.system(size: 14))
                                                }
                                                .foregroundColor(Color("main_text_color"))
                                                .padding(.horizontal, 12)
                                                .padding(.vertical, 6)
                                             )
                                         RoundedRectangle(cornerRadius: 12)
                                             .fill(Color.gray.opacity(0.2))
                                             .frame(height: 32)
                                             .overlay(
                                                HStack(spacing: 4) {
                                                    Text("Popular")
                                                        .font(.custom("SF Pro", size: 14))
                                                        .fontWeight(.medium)
                                                    Image(systemName: "chevron.down")
                                                        .font(.system(size: 14))
                                                }
                                                .foregroundColor(Color("main_text_color"))
                                                .padding(.horizontal, 12)
                                                .padding(.vertical, 6)
                                             )
                                     }
                                     
                                     ScrollView {
                                         LazyVGrid(columns: columns, spacing: 5) {
                                             ForEach(1...20, id: \.self) { index in
                                                 Image("ic_third_collection_view_placeholder")
                                                     .frame(width: 156, height: 156)
                                                     .cornerRadius(12)
                                                 
                                             }
                                         }
                                       
                                 }
                                
                             }
                             .padding(.top, 16)
                             .padding(.horizontal, 16)
                             .background(Color.white)
                             .cornerRadius(16)
                         }
                         .padding(.horizontal, 16)
                     }
                     .navigationBarHidden(true)
            }
            .tabItem {
                Image(systemName: "gift")
                Text("Gits")
            }
            
            NavigationView {
                ZStack {
                    Color.blue.opacity(0.1)
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("Gifts")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 32)
                }
                .navigationBarHidden(true)
            }
            .tabItem {
                Image(systemName: "gift.fill")
                Text("Gifts")
            }
            
            NavigationView {
                ZStack {
                    Color.blue.opacity(0.1)
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("Events")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 32)
                }
                .navigationBarHidden(true)
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("Events")
            }
            
            NavigationView {
                ZStack {
                    Color.blue.opacity(0.1)
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("Cart")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 32)
                }
                .navigationBarHidden(true)
            }
            .tabItem {
                Image(systemName: "cart.fill")
                Text("Cart")
            }
            
            NavigationView {
                ZStack {
                    Color.blue.opacity(0.1)
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 32)
                }
                .navigationBarHidden(true)
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
        }
        .accentColor(Color("main_text_color")) 
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(AuthViewModel())
    }
}

