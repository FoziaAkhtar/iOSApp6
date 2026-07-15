
// ===========================================================
//  ContentView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Controls the main application navigation flow.
//
//  Decides which screen appears based on Firebase
//  authentication status.
//
//  When user is logged out:
//  → Shows Welcome/Login/Register screens.
//
//  When user is authenticated:
//  → Shows the main Recipe Finder application.
// ===========================================================
//  Learning Outcomes:
//  ✓ SwiftUI State Management
//  ✓ Firebase Authentication Flow
//  ✓ MVVM Pattern
//  ✓ EnvironmentObject
//  ✓ Session Persistence
//  ✓ Conditional Navigation
// ===========================================================


import SwiftUI



struct ContentView: View {
    
    
    // -------------------------------------------------------
    // Authentication ViewModel.
    //
    // Created once when the application starts.
    //
    // Stores:
    // • Current Firebase user
    // • Login state
    // • Logout actions
    //
    // Shared with child views using EnvironmentObject.
    // -------------------------------------------------------
    
    @StateObject private var authViewModel =
    AuthViewModel()
    
    
    
    
    var body: some View {
        
        
        Group {
            
            
            // ===================================================
            // Logged Out State
            //
            // If no Firebase user exists:
            //
            // Show Welcome screen where user can:
            // • Login
            // • Create account
            //
            // ===================================================
            
            if authViewModel.user == nil {
                
                
                NavigationStack {
                    
                    
                    WelcomeView()
                }
                
                
            }
            
            
            
            
            // ===================================================
            // Logged In State
            //
            // If Firebase user exists:
            //
            // Open the main Recipe Finder application.
            //
            // ===================================================
            
            else {
                
                
                HomeView()
            }
        }
        
        
        
        
        // -------------------------------------------------------
        // Share authentication state.
        //
        // Allows these views to access the same
        // AuthViewModel instance:
        //
        // • LoginView
        // • RegisterView
        // • HomeView
        //
        // -------------------------------------------------------
        
        .environmentObject(
            authViewModel
        )
    }
}




#Preview {
    
    
    ContentView()
}
