
// ===========================================================
//  MealListView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Displays recipes retrieved from TheMealDB API.
//  Uses MealViewModel to manage API data and UI states.
// ===========================================================
//  Learning Outcomes:
//  ✓ SwiftUI Lists
//  ✓ MVVM Architecture
//  ✓ @StateObject
//  ✓ Async API Data Display
//  ✓ Loading and Error Handling
//  ✓ Navigation Preparation
// ===========================================================


import SwiftUI


struct MealListView: View {
    
    
    // -------------------------------------------------------
    // ViewModel manages recipe data.
    // @StateObject keeps the ViewModel alive while the view exists.
    // -------------------------------------------------------
    
    @StateObject private var viewModel = MealViewModel()
    
    
    
    var body: some View {
        
        
        VStack {
            
            
            // ------------------------------------------------
            // Display loading indicator while API request runs.
            // ------------------------------------------------
            
            if viewModel.isLoading {
                
                
                ProgressView("Loading Recipes...")
                    .padding()
                
                
            }
            
            
            // ------------------------------------------------
            // Display error message if API fails.
            // ------------------------------------------------
            
            else if !viewModel.errorMessage.isEmpty {
                
                
                VStack(spacing: 15) {
                    
                    Image(systemName: "exclamationmark.triangle")
                        .font(.largeTitle)
                    
                    
                    Text(viewModel.errorMessage)
                        .multilineTextAlignment(.center)
                    
                }
                .padding()
                
                
            }
            
            
            // ------------------------------------------------
            // Display recipes from API.
            // ------------------------------------------------
            
            else {
                
                
                List(viewModel.meals) { meal in
                    
                    
                    NavigationLink {
                        
                        // Detail screen will be connected next.
                        Text(meal.strMeal)
                        
                    } label: {
                        
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            
                            Text(meal.strMeal)
                                .font(.headline)
                            
                            
                            Text(
                                meal.strCategory ?? "Unknown Category"
                            )
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            
                            
                            Text(
                                meal.strArea ?? "Unknown Country"
                            )
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            
                        }
                    }
                }
                .refreshable {
                    
                    // Reload recipes when user pulls down.
                    viewModel.fetchMeals()
                }
            }
        }
        .navigationTitle("Recipes")
        
        
        // ----------------------------------------------------
        // Automatically load recipes when screen appears.
        // ----------------------------------------------------
        
        .task {
            
            viewModel.fetchMeals()
        }
    }
}



#Preview {
    
    NavigationStack {
        
        MealListView()
    }
}
