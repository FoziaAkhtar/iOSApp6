
// ===========================================================
//  AuthViewModel.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Connects Firebase Authentication with SwiftUI views.
//  Manages login, registration, logout,
//  and user authentication state.
// ===========================================================
//  Learning Outcomes:
//  ✓ ObservableObject
//  ✓ @Published State Management
//  ✓ Firebase Authentication
//  ✓ MVVM Pattern
//  ✓ Async/Await
//  ✓ Error Handling
// ===========================================================


import Foundation
import FirebaseAuth
import Combine



@MainActor
class AuthViewModel: ObservableObject {
    
    
    // -------------------------------------------------------
    // Stores current Firebase user.
    //
    // Nil means user is logged out.
    // -------------------------------------------------------
    
    @Published var user: User?
    
    
    // -------------------------------------------------------
    // Stores Firebase error messages.
    // -------------------------------------------------------
    
    @Published var errorMessage: String = ""
    
    
    // -------------------------------------------------------
    // Controls loading indicator.
    // -------------------------------------------------------
    
    @Published var isLoading: Bool = false
    
    
    // -------------------------------------------------------
    // Firebase authentication service.
    // -------------------------------------------------------
    
    private let authService = AuthService()
    
    
    
    // =======================================================
    // Initialize ViewModel
    //
    // Testing mode:
    // Application always starts at Login/Register screen.
    // =======================================================
    
    init() {
        
        
        // -------------------------------------------------------
        // Force logged-out state when app starts.
        // -------------------------------------------------------
        
        self.user = nil
    }
    
    
    
    // =======================================================
    // Register User
    //
    // Creates a new Firebase account.
    // =======================================================
    
    func register(
        email: String,
        password: String
    ) {
        
        
        Task {
            
            
            do {
                
                
                isLoading = true
                
                errorMessage = ""
                
                
                try await authService.register(
                    email: email,
                    password: password
                )
                
                
                // Updates user after successful registration.
                user =
                Auth.auth().currentUser
                
                
                isLoading = false
                
                
            } catch {
                
                
                errorMessage =
                error.localizedDescription
                
                isLoading = false
            }
        }
    }
    
    
    
    // =======================================================
    // Login User
    //
    // Signs in existing Firebase user.
    // =======================================================
    
    func login(
        email: String,
        password: String
    ) {
        
        
        Task {
            
            
            do {
                
                
                isLoading = true
                
                errorMessage = ""
                
                
                try await authService.login(
                    email: email,
                    password: password
                )
                
                
                // Updates application after login.
                user =
                Auth.auth().currentUser
                
                
                isLoading = false
                
                
            } catch {
                
                
                errorMessage =
                error.localizedDescription
                
                isLoading = false
            }
        }
    }
    
    
    
    // =======================================================
    // Logout User
    //
    // Removes Firebase session.
    // =======================================================
    
    func logout() {
        
        
        do {
            
            
            try authService.logout()
            
            
            // Returns app to Login screen.
            user = nil
            
            
        } catch {
            
            
            errorMessage =
            error.localizedDescription
        }
    }
}
