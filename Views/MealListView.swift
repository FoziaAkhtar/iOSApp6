
// ===========================================================
//  MealListView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Displays the recipe list screen.
//  This view will later display recipes fetched from API.
// ===========================================================
//  Learning Outcomes:
//  ✓ SwiftUI Views
//  ✓ Navigation
//  ✓ List Display
// ===========================================================


import SwiftUI


struct MealListView: View {
    
    var body: some View {
        
        List {
            
            Text("Recipes will appear here")
            
            Text("API connection coming next")
            
        }
        .navigationTitle("Recipes")
    }
}


#Preview {
    NavigationStack {
        MealListView()
    }
}
