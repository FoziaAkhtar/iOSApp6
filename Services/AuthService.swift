
// ===========================================================
//  AuthService.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Handles Firebase Authentication operations.
//  Provides register, login, and logout functions.
// ===========================================================
//  Learning Outcomes:
//  ✓ Firebase Authentication
//  ✓ Async/Await
//  ✓ Error Handling
//  ✓ Service Layer Pattern
// ===========================================================


import Foundation
import FirebaseAuth



class AuthService {
    
    
    // -------------------------------------------------------
    // Register New User
    //
    // Creates a new Firebase account using email/password.
    // -------------------------------------------------------
    
    func register(
        email: String,
        password: String
    ) async throws {
        
        
        try await Auth.auth()
            .createUser(
                withEmail: email,
                password: password
            )
    }
    
    
    
    // -------------------------------------------------------
    // Login Existing User
    //
    // Authenticates user with Firebase.
    // -------------------------------------------------------
    
    func login(
        email: String,
        password: String
    ) async throws {
        
        
        try await Auth.auth()
            .signIn(
                withEmail: email,
                password: password
            )
    }
    
    
    
    // -------------------------------------------------------
    // Logout User
    //
    // Ends Firebase user session.
    // -------------------------------------------------------
    
    func logout() throws {
        
        
        try Auth.auth().signOut()
    }
    
    
    
    // -------------------------------------------------------
    // Current User Check
    //
    // Returns logged-in user if available.
    // -------------------------------------------------------
    
    var currentUser: User? {
        
        
        Auth.auth().currentUser
    }
}
