
// ===========================================================
//  MealListView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Displays recipes retrieved from TheMealDB API.
//
//  Allows users to:
//  • Browse recipes
//  • Search recipes
//  • Open recipe details
//  • Refresh recipe list
// ===========================================================
//  Learning Outcomes:
//  ✓ MVVM Architecture
//  ✓ @StateObject
//  ✓ Async/Await API Integration
//  ✓ NavigationLink
//  ✓ AsyncImage
//  ✓ Searchable Modifier
//  ✓ Pull To Refresh
// ===========================================================


import SwiftUI



struct MealListView: View {
    
    
    // -------------------------------------------------------
    // ViewModel manages:
    //
    // • Recipe data
    // • API communication
    // • Search
    // • Loading states
    // -------------------------------------------------------
    
    @StateObject private var viewModel =
    MealViewModel()
    
    
    
    var body: some View {
        
        
        Group {
            
            
            // ===================================================
            // Loading State
            // ===================================================
            
            if viewModel.isLoading {
                
                
                VStack(spacing: 20) {
                    
                    
                    ProgressView()
                        .scaleEffect(1.5)
                    
                    
                    Text(
                        "Loading Recipes..."
                    )
                    .font(.headline)
                }
                
                
            }
            
            
            
            // ===================================================
            // Error State
            // ===================================================
            
            else if !viewModel.errorMessage.isEmpty {
                
                
                VStack(spacing: 20) {
                    
                    
                    Image(
                        systemName:
                            "exclamationmark.triangle.fill"
                    )
                    .font(.largeTitle)
                    
                    
                    Text(
                        viewModel.errorMessage
                    )
                    .multilineTextAlignment(.center)
                    
                    
                    Button {
                        
                        
                        viewModel.fetchMeals()
                        
                        
                    } label: {
                        
                        
                        Text(
                            "Try Again"
                        )
                    }
                    .buttonStyle(
                        .borderedProminent
                    )
                }
                .padding()
                
                
            }
            
            
            
            // ===================================================
            // Recipe List
            // ===================================================
            
            else {
                
                
                List(viewModel.meals) { meal in
                    
                    
                    NavigationLink {
                        
                        
                        MealDetailView(
                            meal: meal
                        )
                        
                        
                    } label: {
                        
                        
                        MealCardView(
                            meal: meal
                        )
                    }
                }
            }
        }
        
        
        // -------------------------------------------------------
        // Navigation Title
        // -------------------------------------------------------
        
        .navigationTitle(
            "Recipe Finder"
        )
        
        
        .navigationBarTitleDisplayMode(
            .large
        )
        
        
        // -------------------------------------------------------
        // Search Bar
        // -------------------------------------------------------
        
        .searchable(
            text: $viewModel.searchText,
            placement:
                .navigationBarDrawer(
                    displayMode: .always
                ),
            prompt:
                "Search recipes"
        )
        
        
        // -------------------------------------------------------
        // Search Action
        // -------------------------------------------------------
        
        .onSubmit(
            of: .search
        ) {
            
            
            viewModel.searchMeals()
        }
        
        
        // -------------------------------------------------------
        // Pull To Refresh
        // -------------------------------------------------------
        
        .refreshable {
            
            
            viewModel.refreshMeals()
        }
    }
}



// ===========================================================
//  MealCardView
//
//  Reusable recipe card component.
// ===========================================================


struct MealCardView: View {
    
    
    let meal: Meal
    
    
    var body: some View {
        
        
        HStack(spacing: 15) {
            
            
            // -------------------------------------------------------
            // Recipe Image
            // -------------------------------------------------------
            
            AsyncImage(
                url:
                    URL(
                        string:
                            meal.strMealThumb ?? ""
                    )
            ) { image in
                
                
                image
                    .resizable()
                    .scaledToFill()
                
                
            } placeholder: {
                
                
                ProgressView()
            }
            .frame(
                width: 80,
                height: 80
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 12
                )
            )
            
            
            
            VStack(alignment: .leading, spacing: 6) {
                
                
                Text(
                    meal.strMeal
                )
                .font(.headline)
                
                
                Text(
                    meal.strCategory ??
                    "Unknown Category"
                )
                .font(.subheadline)
                .foregroundStyle(
                    .secondary
                )
                
                
                Text(
                    meal.strArea ??
                    "Unknown Country"
                )
                .font(.caption)
                .foregroundStyle(
                    .secondary
                )
            }
        }
        .padding(.vertical, 5)
    }
}



#Preview {
    
    
    NavigationStack {
        
        
        MealListView()
    }
}
