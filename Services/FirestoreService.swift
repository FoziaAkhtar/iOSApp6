
// ===========================================================
//  FirestoreService.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Handles all Cloud Firestore operations.
//
//  Responsible for:
//  • Saving favorite recipes
//  • Loading favorite recipes
//  • Deleting favorite recipes
//
//  Favorites are stored separately for each
//  authenticated Firebase user.
// ===========================================================
//  Learning Outcomes:
//  ✓ Cloud Firestore
//  ✓ Firebase Authentication
//  ✓ Async/Await
//  ✓ CRUD Operations
//  ✓ Database Integration
//  ✓ Firebase User Security
// ===========================================================


import Foundation
import FirebaseFirestore
import FirebaseAuth



class FirestoreService {
    
    
    // -------------------------------------------------------
    // Firestore database reference.
    //
    // Used for all read and write operations.
    // -------------------------------------------------------
    
    private let db =
    Firestore.firestore()
    
    
    
    // -------------------------------------------------------
    // Returns currently logged-in user's ID.
    //
    // Each user has their own favorites collection.
    // -------------------------------------------------------
    
    private var userID: String? {
        
        
        Auth.auth()
            .currentUser?
            .uid
    }
    
    
    
    
    // =======================================================
    // Add Favorite Recipe
    //
    // Saves a recipe into Firestore.
    //
    // Collection Structure:
    //
    // users
    //    |
    //    userID
    //          |
    //          favorites
    //                |
    //                recipeID
    //
    // =======================================================
    
    func addFavorite(
        _ favorite: FavoriteMeal
    ) async throws {
        
        
        guard let userID = userID else {
            
            
            throw NSError(
                domain: "Authentication",
                code: 401,
                userInfo: [
                    NSLocalizedDescriptionKey:
                        "User is not logged in."
                ]
            )
        }
        
        
        
        try await db
            .collection("users")
            .document(userID)
            .collection("favorites")
            .document(favorite.id)
            .setData(
                [
                    "id":
                        favorite.id,
                    
                    "name":
                        favorite.name,
                    
                    "image":
                        favorite.image
                ]
            )
    }
    
    
    
    
    // =======================================================
    // Fetch Favorite Recipes
    //
    // Retrieves all saved recipes for
    // the current user.
    // =======================================================
    
    func fetchFavorites()
    async throws -> [FavoriteMeal] {
        
        
        guard let userID = userID else {
            
            
            return []
        }
        
        
        
        let snapshot =
        try await db
            .collection("users")
            .document(userID)
            .collection("favorites")
            .getDocuments()
        
        
        
        
        return snapshot.documents.compactMap {
            
            document in
            
            
            let data =
            document.data()
            
            
            return FavoriteMeal(
                
                id:
                    data["id"] as? String ?? "",
                
                name:
                    data["name"] as? String ?? "",
                
                image:
                    data["image"] as? String ?? ""
            )
        }
    }
    
    
    
    
    // =======================================================
    // Delete Favorite Recipe
    //
    // Removes a saved recipe from Firestore.
    // =======================================================
    
    func deleteFavorite(
        _ id: String
    ) async throws {
        
        
        guard let userID = userID else {
            
            
            return
        }
        
        
        
        try await db
            .collection("users")
            .document(userID)
            .collection("favorites")
            .document(id)
            .delete()
    }
}
