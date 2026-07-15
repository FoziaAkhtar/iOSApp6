
// ===========================================================
//  MealDetailView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Displays detailed information for a selected recipe.
//  Shows image, category, area, and cooking instructions.
// ===========================================================
//  Learning Outcomes:
//  ✓ NavigationLink
//  ✓ Passing Data Between Views
//  ✓ AsyncImage
//  ✓ SwiftUI Layout
// ===========================================================


import SwiftUI


struct MealDetailView: View {
    
    
    // Selected recipe passed from MealListView.
    let meal: Meal
    
    
    var body: some View {
        
        
        ScrollView {
            
            
            VStack(alignment: .leading, spacing: 20) {
                
                
                // ------------------------------------------------
                // Recipe Image
                // ------------------------------------------------
                
                AsyncImage(
                    url: URL(
                        string: meal.strMealThumb ?? ""
                    )
                ) { image in
                    
                    image
                        .resizable()
                        .scaledToFit()
                    
                } placeholder: {
                    
                    ProgressView()
                }
                .frame(height: 250)
                .cornerRadius(15)
                
                
                // ------------------------------------------------
                // Recipe Name
                // ------------------------------------------------
                
                Text(meal.strMeal)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                
                // ------------------------------------------------
                // Recipe Information
                // ------------------------------------------------
                
                Text(
                    "Category: \(meal.strCategory ?? "Unknown")"
                )
                
                
                Text(
                    "Country: \(meal.strArea ?? "Unknown")"
                )
                
                
                Divider()
                
                
                // ------------------------------------------------
                // Instructions
                // ------------------------------------------------
                
                Text("Cooking Instructions")
                    .font(.title2)
                    .fontWeight(.bold)
                
                
                Text(
                    meal.strInstructions ??
                    "No instructions available."
                )
                .lineSpacing(5)
                
                
            }
            .padding()
        }
        .navigationTitle("Recipe Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    
    
    NavigationStack {
        
        
        MealDetailView(
            meal: Meal(
                idMeal: "1",
                strMeal: "Chicken Curry",
                strCategory: "Dinner",
                strArea: "Indian",
                strInstructions:
                    "Prepare ingredients and cook until ready.",
                strMealThumb:
                    "https://www.themealdb.com/images/media/meals/1529444830.jpg",
                strYoutube: nil
            )
        )
    }
}
