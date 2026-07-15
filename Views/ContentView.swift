
// ===========================================================
//  ContentView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Controls the main application flow.
//  Shows Login/Register when user is logged out.
//  Shows Recipe Finder when user is authenticated.
// ===========================================================
//  Learning Outcomes:
//  ✓ SwiftUI State Management
//  ✓ Firebase Authentication Flow
//  ✓ MVVM Pattern
//  ✓ EnvironmentObject
// ===========================================================


import SwiftUI



struct ContentView: View {
    
    
    // -------------------------------------------------------
    // Authentication ViewModel.
    //
    // Tracks Firebase login state.
    // Controls whether user sees:
    // Login screen or Recipe application.
    // -------------------------------------------------------
    
    @StateObject private var authViewModel = AuthViewModel()
    
    
    
    var body: some View {
        
        
        Group {
            
            
            if authViewModel.user == nil {
                
                
                // -------------------------------------------------------
                // User is not logged in.
                //
                // Display authentication screen.
                // -------------------------------------------------------
                
                NavigationStack {
                    
                    LoginView()
                }
                
                
            } else {
                
                
                // -------------------------------------------------------
                // User is authenticated.
                //
                // Display main recipe application.
                // -------------------------------------------------------
                
                HomeView()
            }
        }
        
        
        // -------------------------------------------------------
        // Shares authentication state with child views.
        //
        // Available in:
        // LoginView
        // RegisterView
        // HomeView
        // -------------------------------------------------------
        
        .environmentObject(authViewModel)
    }
}



#Preview {
    
    
    ContentView()
}
