
// ===========================================================
//  FavoritesView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Displays recipes saved by the current user.
//
//  Allows users to:
//  • View saved recipes
//  • Remove favorites
//  • Refresh favorite list
// ===========================================================
//  Learning Outcomes:
//  ✓ SwiftUI List
//  ✓ Async/Await
//  ✓ Firebase Firestore
//  ✓ Observable State
//  ✓ MVVM Concepts
//  ✓ Swipe Actions
// ===========================================================


import SwiftUI



struct FavoritesView: View {
    
    
    // -------------------------------------------------------
    // Stores favorite recipes retrieved from Firestore.
    // -------------------------------------------------------
    
    @State private var favorites:
    [FavoriteMeal] = []
    
    
    // -------------------------------------------------------
    // Controls loading indicator.
    // -------------------------------------------------------
    
    @State private var isLoading = false
    
    
    // -------------------------------------------------------
    // Firestore service.
    //
    // Handles favorite recipe operations.
    // -------------------------------------------------------
    
    private let firestoreService =
    FirestoreService()
    
    
    
    var body: some View {
        
        
        Group {
            
            
            // ===================================================
            // Loading State
            // ===================================================
            
            if isLoading {
                
                
                ProgressView(
                    "Loading Favorites..."
                )
                
                
            }
            
            
            
            // ===================================================
            // Empty Favorites State
            // ===================================================
            
            else if favorites.isEmpty {
                
                
                ContentUnavailableView(
                    "No Favorites",
                    systemImage:
                        "star",
                    description:
                        Text(
                            "Save recipes to see them here."
                        )
                )
                
                
            }
            
            
            
            // ===================================================
            // Favorites List
            // ===================================================
            
            else {
                
                
                List {
                    
                    
                    ForEach(
                        favorites
                    ) { meal in
                        
                        
                        FavoriteCardView(
                            meal: meal
                        )
                        
                        
                        .swipeActions {
                            
                            
                            Button(
                                role: .destructive
                            ) {
                                
                                
                                deleteFavorite(
                                    meal
                                )
                            } label: {
                                
                                
                                Label(
                                    "Delete",
                                    systemImage:
                                        "trash"
                                )
                            }
                        }
                    }
                }
            }
        }
        
        
        .navigationTitle(
            "Favorites"
        )
        
        
        .navigationBarTitleDisplayMode(
            .large
        )
        
        
        // -------------------------------------------------------
        // Load favorites when screen opens.
        // -------------------------------------------------------
        
        .task {
            
            
            await loadFavorites()
        }
        
        
        // -------------------------------------------------------
        // Pull to refresh.
        // -------------------------------------------------------
        
        .refreshable {
            
            
            await loadFavorites()
        }
    }
    
    
    
    
    // =======================================================
    // Load Favorites
    //
    // Retrieves saved recipes from Firestore.
    // =======================================================
    
    private func loadFavorites() async {
        
        
        do {
            
            
            isLoading = true
            
            
            favorites =
            try await firestoreService
                .fetchFavorites()
            
            
            isLoading = false
            
            
        } catch {
            
            
            print(
                "Favorites Loading Error:",
                error.localizedDescription
            )
            
            
            isLoading = false
        }
    }
    
    
    
    
    // =======================================================
    // Delete Favorite
    //
    // Removes recipe from Firestore.
    // =======================================================
    
    private func deleteFavorite(
        _ meal: FavoriteMeal
    ) {
        
        
        Task {
            
            
            do {
                
                
                try await firestoreService
                    .deleteFavorite(
                        meal.id
                    )
                
                
                await loadFavorites()
                
                
            } catch {
                
                
                print(
                    "Delete Error:",
                    error.localizedDescription
                )
            }
        }
    }
}




// ===========================================================
// Favorite Card View
//
// Reusable UI component.
// ===========================================================


struct FavoriteCardView: View {
    
    
    let meal: FavoriteMeal
    
    
    var body: some View {
        
        
        HStack(spacing: 15) {
            
            
            AsyncImage(
                url:
                    URL(
                        string:
                            meal.image
                    )
            ) { image in
                
                
                image
                    .resizable()
                    .scaledToFill()
                
                
            } placeholder: {
                
                
                ProgressView()
            }
            .frame(
                width: 80,
                height: 80
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 12
                )
            )
            
            
            
            Text(
                meal.name
            )
            .font(
                .headline
            )
        }
        .padding(.vertical, 5)
    }
}



#Preview {
    
    
    NavigationStack {
        
        
        FavoritesView()
    }
}
