
// ===========================================================
//  MealListView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Displays recipes retrieved from TheMealDB API.
//  Connects MealViewModel with SwiftUI interface.
//  Allows users to select a recipe and view details.
// ===========================================================
//  Learning Outcomes:
//  ✓ MVVM Architecture
//  ✓ @StateObject
//  ✓ API Data Display
//  ✓ NavigationLink
//  ✓ Loading State
//  ✓ Error Handling
//  ✓ Pull To Refresh
// ===========================================================


import SwiftUI


struct MealListView: View {
    
    
    // -------------------------------------------------------
    // ViewModel manages recipe data and API communication.
    // -------------------------------------------------------
    
    @StateObject private var viewModel = MealViewModel()
    
    
    
    var body: some View {
        
        
        VStack {
            
            
            // ------------------------------------------------
            // Loading State
            // ------------------------------------------------
            
            if viewModel.isLoading {
                
                
                ProgressView("Loading Recipes...")
                    .padding()
                
                
            }
            
            
            // ------------------------------------------------
            // Error State
            // ------------------------------------------------
            
            else if !viewModel.errorMessage.isEmpty {
                
                
                VStack(spacing: 15) {
                    
                    
                    Image(systemName:
                            "exclamationmark.triangle.fill")
                    .font(.largeTitle)
                    
                    
                    Text(viewModel.errorMessage)
                        .multilineTextAlignment(.center)
                    
                    
                    Button("Try Again") {
                        
                        viewModel.fetchMeals()
                    }
                    
                }
                .padding()
                
                
            }
            
            
            // ------------------------------------------------
            // Recipe List
            // ------------------------------------------------
            
            else {
                
                
                List(viewModel.meals) { meal in
                    
                    
                    NavigationLink {
                        
                        // Opens recipe detail screen.
                        MealDetailView(meal: meal)
                        
                        
                    } label: {
                        
                        
                        VStack(alignment: .leading, spacing: 6) {
                            
                            
                            Text(meal.strMeal)
                                .font(.headline)
                            
                            
                            Text(
                                meal.strCategory ??
                                "Unknown Category"
                            )
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            
                            
                            Text(
                                meal.strArea ??
                                "Unknown Country"
                            )
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            
                            
                        }
                    }
                }
                .refreshable {
                    
                    // Refresh recipe list.
                    viewModel.fetchMeals()
                }
            }
        }
        .navigationTitle("Recipes")

        .searchable(
            text: $viewModel.searchText,
            prompt: "Search recipes"
        )

        .onSubmit(of: .search) {
            
            viewModel.searchMeals()
        }
        
        // ----------------------------------------------------
        // Load recipes automatically when screen appears.
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
