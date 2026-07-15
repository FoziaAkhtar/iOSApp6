
// ===========================================================
//  Meal.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Represents a recipe object received from TheMealDB API.
//
//  Converts JSON API response data into Swift objects.
//  Used by the recipe list and recipe detail screens.
// ===========================================================
//  Learning Outcomes:
//  ✓ Codable Protocol
//  ✓ JSON Decoding
//  ✓ Swift Structures
//  ✓ API Data Modeling
//  ✓ Identifiable Protocol
// ===========================================================


import Foundation



// ===========================================================
//  Meal Model
//
//  Represents one recipe returned from TheMealDB API.
// ===========================================================


struct Meal: Identifiable, Codable {
    
    
    // -------------------------------------------------------
    // Unique recipe ID from TheMealDB API.
    //
    // Used by SwiftUI List and NavigationLink.
    // -------------------------------------------------------
    
    let idMeal: String
    
    
    // -------------------------------------------------------
    // Recipe name.
    //
    // Example:
    // Chicken Curry
    // Pasta
    // Dessert
    // -------------------------------------------------------
    
    let strMeal: String
    
    
    // -------------------------------------------------------
    // Recipe category.
    //
    // Example:
    // Chicken
    // Seafood
    // Dessert
    // -------------------------------------------------------
    
    let strCategory: String?
    
    
    // -------------------------------------------------------
    // Recipe origin country.
    //
    // Example:
    // Italian
    // Canadian
    // Mexican
    // -------------------------------------------------------
    
    let strArea: String?
    
    
    // -------------------------------------------------------
    // Cooking instructions.
    //
    // Displayed in MealDetailView.
    // -------------------------------------------------------
    
    let strInstructions: String?
    
    
    // -------------------------------------------------------
    // Recipe image URL.
    //
    // Displayed using AsyncImage.
    // -------------------------------------------------------
    
    let strMealThumb: String?
    
    
    // -------------------------------------------------------
    // Optional YouTube recipe video link.
    // -------------------------------------------------------
    
    let strYoutube: String?
    
    
    
    // -------------------------------------------------------
    // Identifiable protocol requirement.
    //
    // Allows Meal to work with:
    // • List
    // • ForEach
    // • NavigationLink
    // -------------------------------------------------------
    
    var id: String {
        
        
        idMeal
    }
}
