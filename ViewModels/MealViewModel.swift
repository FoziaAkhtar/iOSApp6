
// ===========================================================
//  MealViewModel.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Manages recipe data between MealService and SwiftUI views.
//  Handles API requests, loading states, and error messages.
// ===========================================================
//  Learning Outcomes:
//  ✓ MVVM Architecture
//  ✓ ObservableObject
//  ✓ @Published State Management
//  ✓ Async/Await
//  ✓ API Data Handling
//  ✓ Error Handling
// ===========================================================


import Foundation
import Combine


// ===========================================================
// ViewModel responsible for managing recipe information.
// Connects the API service with SwiftUI views.
// ===========================================================

@MainActor
class MealViewModel: ObservableObject {
    
    
    // -------------------------------------------------------
    // Stores recipes received from TheMealDB API.
    // SwiftUI automatically updates when this changes.
    // -------------------------------------------------------
    
    @Published var meals: [Meal] = []
    
    
    // -------------------------------------------------------
    // Controls the loading indicator.
    // True while API request is running.
    // -------------------------------------------------------
    
    @Published var isLoading: Bool = false
    
    
    // -------------------------------------------------------
    // Stores error messages shown to the user.
    // -------------------------------------------------------
    
    @Published var errorMessage: String = ""
    
    
    // -------------------------------------------------------
    // API service responsible for fetching recipes.
    // -------------------------------------------------------
    
    private let mealService = MealService()
    
    
    
    // =======================================================
    // Fetch Meals
    //
    // Retrieves recipes from TheMealDB API.
    //
    // Parameter:
    // searchTerm - Recipe keyword
    //
    // Default:
    // chicken
    //
    // Uses:
    // ✓ async/await
    // ✓ URLSession
    // ✓ Error handling
    // =======================================================
    
    func fetchMeals(searchTerm: String = "chicken") {
        
        
        Task {
            
            
            do {
                
                
                // Start loading.
                isLoading = true
                
                
                // Clear previous errors.
                errorMessage = ""
                
                
                // Call API service.
                let results = try await mealService.fetchMeals(
                    searchTerm: searchTerm
                )
                
                
                // Update recipe list.
                meals = results
                
                
                // Stop loading.
                isLoading = false
                
                
            } catch {
                
                
                // Handle API errors.
                errorMessage =
                "Unable to load recipes. Please try again."
                
                
                isLoading = false
            }
        }
    }
    
    
    // =======================================================
    // Search Recipes
    //
    // Allows searching recipes using keywords.
    // =======================================================
    
    func searchMeals(keyword: String) {
        
        
        guard !keyword.isEmpty else {
            
            fetchMeals()
            return
        }
        
        
        fetchMeals(searchTerm: keyword)
    }
}
