
// ===========================================================
//  LoginView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Provides user login interface using Firebase Authentication.
// ===========================================================
//  Learning Outcomes:
//  ✓ SwiftUI Forms
//  ✓ TextField
//  ✓ SecureField
//  ✓ State Management
//  ✓ Firebase Authentication
// ===========================================================


import SwiftUI



struct LoginView: View {
    
    
    // Shared authentication ViewModel.
    @EnvironmentObject var authViewModel: AuthViewModel
    
    
    // User input fields.
    @State private var email = ""
    @State private var password = ""
    
    
    // Controls registration navigation.
    @State private var showRegister = false
    
    
    
    var body: some View {
        
        
        NavigationStack {
            
            
            VStack(spacing: 20) {
                
                
                Text("Recipe Finder")
                    .font(.largeTitle)
                    .bold()
                
                
                TextField(
                    "Email",
                    text: $email
                )
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                
                
                SecureField(
                    "Password",
                    text: $password
                )
                .textFieldStyle(.roundedBorder)
                
                
                
                if !authViewModel.errorMessage.isEmpty {
                    
                    Text(authViewModel.errorMessage)
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                }
                
                
                
                Button {
                    
                    authViewModel.login(
                        email: email,
                        password: password
                    )
                    
                } label: {
                    
                    if authViewModel.isLoading {
                        
                        ProgressView()
                        
                    } else {
                        
                        Text("Login")
                    }
                }
                .buttonStyle(.borderedProminent)
                
                
                
                Button {
                    
                    showRegister = true
                    
                } label: {
                    
                    Text("Create Account")
                }
                
                
            }
            .padding()
            .navigationTitle("Login")
            
            
            .navigationDestination(
                isPresented: $showRegister
            ) {
                
                RegisterView()
            }
        }
    }
}



#Preview {
    
    
    LoginView()
        .environmentObject(AuthViewModel())
}
