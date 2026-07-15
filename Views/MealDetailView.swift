
// ===========================================================
//  MealDetailView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Displays complete recipe information.
//
//  Allows users to:
//  • View recipe image
//  • Read ingredients
//  • Read cooking instructions
//  • Save recipes to Favorites
// ===========================================================
//  Learning Outcomes:
//  ✓ SwiftUI Layout
//  ✓ AsyncImage
//  ✓ Navigation
//  ✓ Firebase Firestore
//  ✓ MVVM Pattern
// ===========================================================


import SwiftUI



struct MealDetailView: View {
    
    
    // -------------------------------------------------------
    // Selected recipe received from MealListView.
    // -------------------------------------------------------
    
    let meal: Meal
    
    
    // -------------------------------------------------------
    // Controls favorite button state.
    // -------------------------------------------------------
    
    @State private var isSaved = false
    
    
    // -------------------------------------------------------
    // Firestore service.
    //
    // Saves favorite recipes.
    // -------------------------------------------------------
    
    private let firestoreService =
    FirestoreService()
    
    
    
    var body: some View {
        
        
        ScrollView {
            
            
            VStack(
                alignment: .leading,
                spacing: 20
            ) {
                
                
                // ===================================================
                // Recipe Image
                // ===================================================
                
                AsyncImage(
                    url:
                        URL(
                            string:
                                meal.strMealThumb ?? ""
                        )
                ) { image in
                    
                    
                    image
                        .resizable()
                        .scaledToFill()
                    
                    
                } placeholder: {
                    
                    
                    ProgressView()
                }
                .frame(
                    height: 250
                )
                .frame(
                    maxWidth: .infinity
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 20
                    )
                )
                
                
                
                
                // ===================================================
                // Recipe Information
                // ===================================================
                
                Text(
                    meal.strMeal
                )
                .font(
                    .largeTitle
                )
                .bold()
                
                
                HStack {
                    
                    
                    Text(
                        meal.strCategory ??
                        "Unknown Category"
                    )
                    
                    
                    Spacer()
                    
                    
                    Text(
                        meal.strArea ??
                        "Unknown Country"
                    )
                }
                .font(
                    .subheadline
                )
                .foregroundStyle(
                    .secondary
                )
                
                
                
                
                // ===================================================
                // Favorite Button
                // ===================================================
                
                Button {
                    
                    
                    saveFavorite()
                    
                    
                } label: {
                    
                    
                    Label(
                        isSaved
                        ? "Saved"
                        : "Add To Favorites",
                        
                        systemImage:
                            isSaved
                        ? "star.fill"
                        : "star"
                    )
                    .frame(
                        maxWidth: .infinity
                    )
                }
                .buttonStyle(
                    .borderedProminent
                )
                
                
                
                
                Divider()
                
                
                
                
                // ===================================================
                // Instructions Section
                // ===================================================
                
                Text(
                    "Instructions"
                )
                .font(
                    .title2
                )
                .bold()
                
                
                Text(
                    meal.strInstructions ??
                    "No instructions available."
                )
                .font(
                    .body
                )
                
                
                
                
                Divider()
                
                
                
                
                // ===================================================
                // YouTube Section
                // ===================================================
                
                if let youtube =
                    meal.strYoutube,
                   !youtube.isEmpty {
                    
                    
                    Link(
                        destination:
                            URL(
                                string:
                                    youtube
                            )!
                    ) {
                        
                        
                        Label(
                            "Watch Video",
                            systemImage:
                                "play.rectangle.fill"
                        )
                    }
                }
            }
            .padding()
        }
        .navigationTitle(
            "Recipe Details"
        )
        .navigationBarTitleDisplayMode(
            .inline
        )
    }
    
    
    
    // =======================================================
    // Save Favorite Recipe
    //
    // Sends recipe data to Firestore.
    // =======================================================
    
    private func saveFavorite() {
        
        
        Task {
            
            
            do {
                
                
                let favorite =
                FavoriteMeal(
                    id:
                        meal.idMeal,
                    
                    name:
                        meal.strMeal,
                    
                    image:
                        meal.strMealThumb ?? ""
                )
                
                
                try await firestoreService
                    .addFavorite(
                        favorite
                    )
                
                
                isSaved = true
                
                
            } catch {
                
                
                print(
                    "Favorite Error:",
                    error.localizedDescription
                )
            }
        }
    }
}



#Preview {
    
    
    NavigationStack {
        
        
        Text(
            "Recipe Preview"
        )
    }
}
