
// ===========================================================
//  MealResponse.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Handles the complete response returned by TheMealDB API.
//  The API returns meals inside a JSON array.
// ===========================================================
//  Learning Outcomes:
//  ✓ Codable
//  ✓ API Response Handling
//  ✓ JSON Arrays
// ===========================================================


import Foundation


// Represents API response containing multiple meals.
struct MealResponse: Codable {
    
    // List of meals returned from API.
    let meals: [Meal]?
}
