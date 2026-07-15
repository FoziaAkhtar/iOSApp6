
// ===========================================================
//  RegisterView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Allows new users to create a Firebase account.
//  Uses AuthViewModel to communicate with Firebase.
// ===========================================================
//  Learning Outcomes:
//  ✓ SwiftUI Forms
//  ✓ @State Management
//  ✓ Firebase Authentication
//  ✓ MVVM Pattern
//  ✓ Error Handling
// ===========================================================


import SwiftUI


struct RegisterView: View {
    
    
    // -------------------------------------------------------
    // Authentication ViewModel.
    // Handles Firebase registration logic.
    // -------------------------------------------------------
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    
    // -------------------------------------------------------
    // User input fields.
    // -------------------------------------------------------
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    
    
    var body: some View {
        
        
        VStack(spacing: 20) {
            
            
            Text("Create Account")
                .font(.largeTitle)
                .bold()
            
            
            // -------------------------------------------------------
            // Email Input
            // -------------------------------------------------------
            
            TextField(
                "Email",
                text: $email
            )
            .textFieldStyle(.roundedBorder)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            
            
            
            // -------------------------------------------------------
            // Password Input
            // -------------------------------------------------------
            
            SecureField(
                "Password",
                text: $password
            )
            .textFieldStyle(.roundedBorder)
            
            
            
            // -------------------------------------------------------
            // Confirm Password Input
            // -------------------------------------------------------
            
            SecureField(
                "Confirm Password",
                text: $confirmPassword
            )
            .textFieldStyle(.roundedBorder)
            
            
            
            // -------------------------------------------------------
            // Display Firebase Errors
            // -------------------------------------------------------
            
            if !authViewModel.errorMessage.isEmpty {
                
                
                Text(authViewModel.errorMessage)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
            }
            
            
            
            // -------------------------------------------------------
            // Register Button
            // -------------------------------------------------------
            
            Button {
                
                
                registerUser()
                
                
            } label: {
                
                
                if authViewModel.isLoading {
                    
                    ProgressView()
                    
                } else {
                    
                    Text("Register")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderedProminent)
            
            
        }
        .padding()
        .navigationTitle("Register")
    }
    
    
    
    // =======================================================
    // Registration Validation
    // =======================================================
    
    private func registerUser() {
        
        
        // Check empty fields.
        guard !email.isEmpty,
              !password.isEmpty else {
            
            
            authViewModel.errorMessage =
            "Please enter email and password."
            
            return
        }
        
        
        // Check password matching.
        guard password == confirmPassword else {
            
            
            authViewModel.errorMessage =
            "Passwords do not match."
            
            return
        }
        
        
        // Call Firebase registration.
        authViewModel.register(
            email: email,
            password: password
        )
    }
}



#Preview {
    
    
    RegisterView()
        .environmentObject(AuthViewModel())
}
