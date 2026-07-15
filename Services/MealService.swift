
// ===========================================================
//  MealService.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Handles communication with TheMealDB API.
//  Retrieves recipe information using URLSession.
// ===========================================================
//  Learning Outcomes:
//  ✓ URLSession
//  ✓ Async/Await
//  ✓ JSON Decoding
//  ✓ API Error Handling
// ===========================================================


import Foundation


// Service responsible for retrieving meal data.
class MealService {
    
    
    // API endpoint used to search meals.
    private let baseURL =
    "https://www.themealdb.com/api/json/v1/1/search.php?s="
    
    
    // -------------------------------------------------------
    // Fetch meals from API
    //
    // Parameter:
    // searchTerm - User's recipe search keyword
    //
    // Returns:
    // Array of Meal objects
    //
    // Uses:
    // async/await networking
    // -------------------------------------------------------
    
    func fetchMeals(searchTerm: String) async throws -> [Meal] {
        
        
        // Create complete URL.
        guard let url = URL(
            string: baseURL + searchTerm
        ) else {
            throw MealError.invalidURL
        }
        
        
        // Request data from API.
        let (data, _) = try await URLSession.shared.data(
            from: url
        )
        
        
        // Decode JSON response.
        let response = try JSONDecoder().decode(
            MealResponse.self,
            from: data
        )
        
        
        // Return meals or empty array.
        return response.meals ?? []
    }
}


// Custom errors for API handling.
enum MealError: Error {
    
    case invalidURL
    case noData
}
