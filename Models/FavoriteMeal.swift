
// ===========================================================
//  FavoriteMeal.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Represents a saved favorite recipe.
//
//  This model is used to:
//  • Display favorite recipes in FavoritesView
//  • Store favorite recipes in Firestore
//  • Retrieve saved recipes for the logged-in user
// ===========================================================
//  Learning Outcomes:
//  ✓ Data Modeling
//  ✓ Identifiable Protocol
//  ✓ Codable Protocol
//  ✓ Firebase Firestore Storage
//  ✓ MVVM Data Layer
// ===========================================================


import Foundation



struct FavoriteMeal: Identifiable, Codable {
    
    
    // -------------------------------------------------------
    // Unique recipe identifier.
    //
    // Used as:
    // • SwiftUI List identifier
    // • Firestore document ID
    // -------------------------------------------------------
    
    var id: String
    
    
    // -------------------------------------------------------
    // Recipe display name.
    //
    // Appears in Favorites list.
    // -------------------------------------------------------
    
    var name: String
    
    
    // -------------------------------------------------------
    // Recipe image URL.
    //
    // Used by AsyncImage to display recipe picture.
    // -------------------------------------------------------
    
    var image: String
}
