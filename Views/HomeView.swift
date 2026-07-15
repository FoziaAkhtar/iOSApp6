
// ===========================================================
//  HomeView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Main application screen after successful login.
//
//  Provides:
//  • Recipe browsing
//  • Favorite recipes
//  • User logout
// ===========================================================
//  Learning Outcomes:
//  ✓ SwiftUI TabView
//  ✓ NavigationStack
//  ✓ Toolbar Actions
//  ✓ EnvironmentObject
//  ✓ Firebase Authentication
// ===========================================================


import SwiftUI



struct HomeView: View {
    
    
    // -------------------------------------------------------
    // Authentication ViewModel.
    //
    // Controls Firebase logout.
    // -------------------------------------------------------
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    
    
    // -------------------------------------------------------
    // Controls selected tab.
    //
    // 0 = Recipes
    // 1 = Favorites
    // -------------------------------------------------------
    
    @State private var selectedTab = 0
    
    
    
    var body: some View {
        
        
        TabView(
            selection: $selectedTab
        ) {
            
            
            // ===================================================
            // Recipes Tab
            // ===================================================
            
            NavigationStack {
                
                
                MealListView()
                
                
                    .navigationTitle(
                        "Recipe Finder"
                    )
                
                
                    .toolbar {
                        
                        
                        ToolbarItem(
                            placement:
                                .topBarTrailing
                        ) {
                            
                            
                            Menu {
                                
                                
                                Button {
                                    
                                    
                                    authViewModel.logout()
                                    
                                    
                                } label: {
                                    
                                    
                                    Label(
                                        "Logout",
                                        systemImage:
                                            "rectangle.portrait.and.arrow.right"
                                    )
                                }
                                
                                
                            } label: {
                                
                                
                                Image(
                                    systemName:
                                        "person.circle"
                                )
                            }
                        }
                    }
            }
            
            .tabItem {
                
                
                Image(
                    systemName:
                        "fork.knife"
                )
                
                
                Text(
                    "Recipes"
                )
            }
            
            .tag(0)
            
            
            
            
            // ===================================================
            // Favorites Tab
            // ===================================================
            
            NavigationStack {
                
                
                FavoritesView()
                
                
                    .navigationTitle(
                        "Favorites"
                    )
            }
            
            .tabItem {
                
                
                Image(
                    systemName:
                        "star.fill"
                )
                
                
                Text(
                    "Favorites"
                )
            }
            
            .tag(1)
        }
    }
}



#Preview {
    
    
    HomeView()
        .environmentObject(
            AuthViewModel()
        )
}
