
// ===========================================================
//  AuthViewModel.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Connects Firebase Authentication with SwiftUI views.
//  Manages login, registration, logout, and user session state.
// ===========================================================
//  Learning Outcomes:
//  ✓ ObservableObject
//  ✓ @Published State Management
//  ✓ Firebase Authentication
//  ✓ MVVM Pattern
//  ✓ Async/Await
//  ✓ Error Handling
//  ✓ Session Persistence
// ===========================================================


import Foundation
import FirebaseAuth
import Combine



@MainActor
class AuthViewModel: ObservableObject {
    
    
    // -------------------------------------------------------
    // Stores the current Firebase user.
    //
    // Nil means the user is logged out.
    //
    // Used by ContentView to decide whether to show:
    // Login screen or Recipe application.
    // -------------------------------------------------------
    
    @Published var user: User?
    
    
    // -------------------------------------------------------
    // Stores authentication error messages.
    //
    // Displayed in LoginView and RegisterView.
    // -------------------------------------------------------
    
    @Published var errorMessage: String = ""
    
    
    // -------------------------------------------------------
    // Controls loading indicator.
    //
    // True while Firebase request is running.
    // -------------------------------------------------------
    
    @Published var isLoading: Bool = false
    
    
    // -------------------------------------------------------
    // Firebase authentication service.
    //
    // Handles communication with Firebase Auth.
    // -------------------------------------------------------
    
    private let authService = AuthService()
    
    
    
    // -------------------------------------------------------
    // Initializes ViewModel.
    //
    // Checks if a Firebase user session already exists.
    //
    // If user is already logged in:
    // → Opens Recipe Finder directly.
    //
    // If no user exists:
    // → Shows Login/Register screen.
    // -------------------------------------------------------
    
    init() {
        
        
        self.user = authService.currentUser
    }
    
    
    
    // =======================================================
    // Register New User
    //
    // Creates a Firebase account using email/password.
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
                user = authService.currentUser
                
                isLoading = false
                
                
            } catch {
                
                
                // Stores Firebase error message.
                errorMessage =
                error.localizedDescription
                
                isLoading = false
            }
        }
    }
    
    
    
    // =======================================================
    // Login Existing User
    //
    // Authenticates user with Firebase.
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
                
                
                // Updates application state after login.
                user = authService.currentUser
                
                isLoading = false
                
                
            } catch {
                
                
                // Stores Firebase login error.
                errorMessage =
                error.localizedDescription
                
                isLoading = false
            }
        }
    }
    
    
    
    // =======================================================
    // Logout User
    //
    // Removes Firebase authentication session.
    // =======================================================
    
    func logout() {
        
        
        do {
            
            
            try authService.logout()
            
            
            // Returns app to Login screen.
            user = nil
            
            
        } catch {
            
            
            // Stores logout error.
            errorMessage =
            error.localizedDescription
        }
    }
}
