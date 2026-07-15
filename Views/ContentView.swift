
// ===========================================================
//  ContentView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Initial entry screen for Recipe Finder.
//  This view will later control authentication flow.
// ===========================================================
//  Learning Outcomes:
//  ✓ SwiftUI View Structure
//  ✓ Navigation Preparation
// ===========================================================


import SwiftUI


struct ContentView: View {
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                
                Image(systemName: "fork.knife.circle.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.orange)
                
                
                Text("Recipe Finder")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                
                Text("Discover delicious recipes from around the world")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                
                
                NavigationLink {
                    MealListView()
                } label: {
                    Text("Browse Recipes")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.orange)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
