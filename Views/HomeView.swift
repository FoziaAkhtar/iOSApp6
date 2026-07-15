
// ===========================================================
//  HomeView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Main recipe screen after successful login.
//  Includes logout option.
// ===========================================================


import SwiftUI


struct HomeView: View {
    
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    
    var body: some View {
        
        
        NavigationStack {
            
            
            MealListView()
                .navigationTitle("Recipe Finder")
            
            
                .toolbar {
                    
                    
                    ToolbarItem(
                        placement: .topBarTrailing
                    ) {
                        
                        
                        Button("Logout") {
                            
                            authViewModel.logout()
                        }
                    }
                }
        }
    }
}



#Preview {
    
    
    HomeView()
        .environmentObject(AuthViewModel())
}
