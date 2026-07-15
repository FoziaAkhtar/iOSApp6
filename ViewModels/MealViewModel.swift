
// ===========================================================
//  MealViewModel.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Acts as the bridge between the API service
//  and the SwiftUI views.
//
//  Responsible for:
//  • Loading recipes
//  • Searching recipes
//  • Managing loading state
//  • Displaying error messages
// ===========================================================
//  Learning Outcomes:
//  ✓ MVVM Architecture
//  ✓ ObservableObject
//  ✓ @Published
//  ✓ Async/Await
//  ✓ API Integration
//  ✓ Error Handling
// ===========================================================

import Foundation
import Combine



@MainActor
class MealViewModel: ObservableObject {
    
    
    // -------------------------------------------------------
    // Stores recipes returned from TheMealDB API.
    //
    // MealListView automatically refreshes whenever
    // this array changes.
    // -------------------------------------------------------
    
    @Published var meals: [Meal] = []
    
    
    // -------------------------------------------------------
    // Controls loading indicator.
    //
    // True while recipes are downloading.
    // -------------------------------------------------------
    
    @Published var isLoading = false
    
    
    // -------------------------------------------------------
    // Stores error messages.
    //
    // Displayed when an API request fails.
    // -------------------------------------------------------
    
    @Published var errorMessage = ""
    
    
    // -------------------------------------------------------
    // Stores the user's search text.
    //
    // Bound to SwiftUI Search Bar.
    // -------------------------------------------------------
    
    @Published var searchText = ""
    
    
    // -------------------------------------------------------
    // API Service.
    //
    // Handles communication with TheMealDB API.
    // -------------------------------------------------------
    
    private let mealService = MealService()
    
    
    
    // =======================================================
    // Initialize ViewModel
    //
    // Loads default recipes when created.
    // =======================================================
    
    init() {
        
        fetchMeals()
    }
    
    
    
    // =======================================================
    // Fetch Meals
    //
    // Downloads recipes from TheMealDB API.
    //
    // Parameter:
    // searchTerm
    //
    // Default value:
    // chicken
    // =======================================================
    
    func fetchMeals(
        searchTerm: String = "chicken"
    ) {
        
        
        Task {
            
            
            isLoading = true
            
            errorMessage = ""
            
            
            do {
                
                
                let results =
                try await mealService.fetchMeals(
                    searchTerm: searchTerm
                )
                
                
                meals = results
                
                
            } catch {
                
                
                meals = []
                
                
                errorMessage =
                "Unable to load recipes. Please try again."
            }
            
            
            isLoading = false
        }
    }
    
    
    
    // =======================================================
    // Search Recipes
    //
    // Called whenever the user searches.
    //
    // Empty search:
    // Loads default recipes.
    //
    // Otherwise:
    // Searches entered keyword.
    // =======================================================
    
    func searchMeals() {
        
        
        let keyword =
        searchText
            .trimmingCharacters(
                in: .whitespacesAndNewlines
            )
        
        
        if keyword.isEmpty {
            
            
            fetchMeals()
            
            
        } else {
            
            
            fetchMeals(
                searchTerm: keyword
            )
        }
    }
    
    
    
    // =======================================================
    // Refresh Recipes
    //
    // Used by Pull-To-Refresh.
    // =======================================================
    
    func refreshMeals() {
        
        
        searchMeals()
    }
}
