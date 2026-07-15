
// ===========================================================
//  Meal.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Represents a recipe object received from TheMealDB API.
//  This model converts JSON data into Swift objects.
// ===========================================================
//  Learning Outcomes:
//  ✓ Codable
//  ✓ JSON Decoding
//  ✓ Swift Structures
//  ✓ API Data Modeling
// ===========================================================

import Foundation


// Meal model represents one recipe.
struct Meal: Identifiable, Codable {
    
    // Unique identifier required by SwiftUI Lists.
    let idMeal: String
    
    // Recipe name.
    let strMeal: String
    
    // Recipe category.
    let strCategory: String?
    
    // Recipe origin country.
    let strArea: String?
    
    // Recipe instructions.
    let strInstructions: String?
    
    // Recipe image URL.
    let strMealThumb: String?
    
    // Recipe video URL (optional).
    let strYoutube: String?
    
    
    // Converts API ID into SwiftUI Identifiable ID.
    var id: String {
        idMeal
    }
}
