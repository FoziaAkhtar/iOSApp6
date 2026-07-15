
// ===========================================================
//  FavoriteMeal.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Represents a user's favorite recipe.
//  This model will later be stored using Firebase Firestore.
// ===========================================================
//  Learning Outcomes:
//  ✓ Firebase Firestore Preparation
//  ✓ Codable Data Storage
// ===========================================================


import Foundation


struct FavoriteMeal: Identifiable, Codable {
    
    // Firestore document ID.
    var id: String
    
    // Recipe ID from API.
    var mealID: String
    
    // Recipe name.
    var name: String
    
    // Recipe image.
    var imageURL: String
}
