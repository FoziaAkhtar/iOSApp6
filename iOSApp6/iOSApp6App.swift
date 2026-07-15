
// ===========================================================
//  iOSApp6App.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Application entry point.
//  Initializes Firebase services.
// ===========================================================


import SwiftUI
import FirebaseCore


@main
struct iOSApp6App: App {
    
    
    init() {
        
        // Initialize Firebase configuration.
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        
        WindowGroup {
            
            ContentView()
        }
    }
}
