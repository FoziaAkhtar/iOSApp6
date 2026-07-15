
// ===========================================================
//  MealViewModel.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Manages recipe data between API service and SwiftUI views.
//  Handles loading, searching, and error states.
// ===========================================================
//  Learning Outcomes:
//  ✓ MVVM Architecture
//  ✓ ObservableObject
//  ✓ @Published State Management
//  ✓ Async/Await
//  ✓ API Searching
//  ✓ Error Handling
// ===========================================================


import Foundation
import Combine


@MainActor
class MealViewModel: ObservableObject {
    
    
    // Stores recipes returned from API.
    @Published var meals: [Meal] = []
    
    
    // Controls loading indicator.
    @Published var isLoading: Bool = false
    
    
    // Stores error messages.
    @Published var errorMessage: String = ""
    
    
    // Stores current search text.
    @Published var searchText: String = ""
    
    
    // API service.
    private let mealService = MealService()
    
    
    
    // =======================================================
    // Fetch Meals
    //
    // Retrieves recipes from TheMealDB API.
    //
    // Parameter:
    // searchTerm - Recipe keyword
    // =======================================================
    
    func fetchMeals(searchTerm: String = "chicken") {
        
        
        Task {
            
            
            do {
                
                
                isLoading = true
                
                errorMessage = ""
                
                
                let results = try await mealService.fetchMeals(
                    searchTerm: searchTerm
                )
                
                
                meals = results
                
                
                isLoading = false
                
                
            } catch {
                
                
                errorMessage =
                "Unable to load recipes."
                
                
                isLoading = false
            }
        }
    }
    
    
    
    // =======================================================
    // Search Recipes
    //
    // Called when user enters a search term.
    // =======================================================
    
    func searchMeals() {
        
        
        let keyword = searchText.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        
        
        // If search is empty, reload default recipes.
        if keyword.isEmpty {
            
            fetchMeals()
            
        } else {
            
            fetchMeals(searchTerm: keyword)
        }
    }
}
