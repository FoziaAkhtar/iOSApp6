
// ===========================================================
//  LoginView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Provides user login screen.
//  Authenticates users using Firebase Authentication.
// ===========================================================
//  Learning Outcomes:
//  ✓ SwiftUI Forms
//  ✓ Firebase Authentication
//  ✓ EnvironmentObject
//  ✓ MVVM Pattern
//  ✓ Error Handling
// ===========================================================


import SwiftUI



struct LoginView: View {
    
    
    // -------------------------------------------------------
    // Authentication ViewModel.
    //
    // Shared from ContentView.
    // -------------------------------------------------------
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    
    // -------------------------------------------------------
    // User input fields.
    // -------------------------------------------------------
    
    @State private var email: String = ""
    
    @State private var password: String = ""
    
    
    
    var body: some View {
        
        
        NavigationStack {
            
            
            VStack(spacing: 20) {
                
                
                // -------------------------------------------------------
                // App Title
                // -------------------------------------------------------
                
                Text(
                    "Recipe Finder"
                )
                .font(.largeTitle)
                .bold()
                
                
                
                // -------------------------------------------------------
                // Email Field
                // -------------------------------------------------------
                
                TextField(
                    "Email",
                    text: $email
                )
                .textFieldStyle(.roundedBorder)
                .keyboardType(
                    .emailAddress
                )
                .autocorrectionDisabled()
                
                
                
                // -------------------------------------------------------
                // Password Field
                // -------------------------------------------------------
                
                SecureField(
                    "Password",
                    text: $password
                )
                .textFieldStyle(.roundedBorder)
                
                
                
                // -------------------------------------------------------
                // Login Button
                // -------------------------------------------------------
                
                Button {
                    
                    
                    authViewModel.login(
                        email: email,
                        password: password
                    )
                    
                    
                } label: {
                    
                    
                    if authViewModel.isLoading {
                        
                        
                        ProgressView()
                        
                        
                    } else {
                        
                        
                        Text(
                            "Login"
                        )
                    }
                }
                .buttonStyle(
                    .borderedProminent
                )
                
                
                
                // -------------------------------------------------------
                // Error Message
                // -------------------------------------------------------
                
                if !authViewModel.errorMessage.isEmpty {
                    
                    
                    Text(
                        authViewModel.errorMessage
                    )
                    .foregroundColor(.red)
                }
                
                
                
                // -------------------------------------------------------
                // Register Navigation
                // -------------------------------------------------------
                
                NavigationLink {
                    
                    
                    RegisterView()
                    
                    
                } label: {
                    
                    
                    Text(
                        "Create Account"
                    )
                }
                
                
            }
            .padding()
            .navigationTitle(
                "Login"
            )
        }
    }
}



#Preview {
    
    
    LoginView()
        .environmentObject(
            AuthViewModel()
        )
}
