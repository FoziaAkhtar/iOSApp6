iOSApp6
│
├── Models
│     ├── Meal.swift ✅
│     └── FavoriteMeal.swift ✅
│
├── ViewModels
│     ├── AuthViewModel.swift ✅
│     └── MealViewModel.swift ✅
│
├── Services
│     ├── AuthService.swift ✅
│     ├── MealService.swift
│     └── FirestoreService.swift ✅
│
└── Views
      ├── WelcomeView.swift ✅
      ├── LoginView.swift
      ├── RegisterView
      ├── HomeView.swift ✅
      ├── MealListView.swift ✅
      ├── MealDetailView.swift ✅
      └── FavoritesView.swift ✅

# 🍽️ iOSApp6 - Recipe Finder Application

## Created By

**Fozia Akhtar**

---

# 📱 Project Overview

iOSApp6 is a SwiftUI-based Recipe Finder application that allows users to discover, search, view, and save recipes.

The application integrates **TheMealDB API** for recipe data and **Firebase Authentication + Cloud Firestore** for user management and favorite recipe storage.

The project demonstrates modern iOS development concepts including:

- SwiftUI user interface design
- MVVM architecture
- REST API integration
- Firebase Authentication
- Cloud Firestore database operations
- Async/Await programming
- State management

---

# 🎯 Project Purpose

The purpose of this application is to provide users with an easy way to explore recipes and create a personalized collection of favorite meals.

Users can:

- Create an account
- Login securely
- Browse recipes
- Search recipes
- View recipe details
- Save favorite recipes
- Remove saved favorites
- Logout securely

---

# ✨ Features

## 🔐 Firebase Authentication

The application uses Firebase Authentication to manage user accounts.

Features include:

- User registration with email/password
- Secure login
- Persistent authentication session
- Logout functionality
- Firebase error handling

---

## 🍴 Recipe Browsing

Users can browse recipes retrieved from TheMealDB API.

Features:

- Recipe list display
- Recipe categories
- Recipe origin information
- Recipe images
- Pull-to-refresh support

---

## 🔎 Recipe Search

Users can search recipes by keyword.

Examples:

- Chicken
- Pasta
- Seafood
- Dessert

The search feature communicates with TheMealDB API and updates the recipe list dynamically.

---

## 📖 Recipe Details

Each recipe contains:

- Recipe name
- Category
- Country of origin
- Cooking instructions
- Recipe image
- Optional YouTube video link

---

## ⭐ Favorite Recipes

Users can save recipes to their personal favorites.

Favorites are stored using:

**Firebase Cloud Firestore**

Database structure:


Each user's favorites are stored separately.

---

# 🏗️ Architecture

The application follows the **MVVM (Model-View-ViewModel)** architecture.


---

# 🛠️ Technologies Used

## Programming Language

- Swift

## Frameworks

- SwiftUI
- Foundation
- Combine

## Backend Services

- Firebase Authentication
- Cloud Firestore

## API

- TheMealDB REST API

## Development Tools

- Xcode
- Swift Package Manager
- GitHub

---

# 📚 Learning Outcomes

This project demonstrates:

✅ SwiftUI Views  
✅ NavigationStack  
✅ TabView Navigation  
✅ MVVM Architecture  
✅ ObservableObject  
✅ @Published State Management  
✅ EnvironmentObject  
✅ Codable Models  
✅ JSON API Decoding  
✅ Async/Await Networking  
✅ Firebase Authentication  
✅ Cloud Firestore CRUD Operations  
✅ Error Handling  

---

# 🚀 Installation Instructions

## Requirements

- macOS
- Xcode
- iOS Simulator or physical iPhone
- Firebase account

---

## Setup Steps

### 1. Clone Repository

```bash
git clone https://github.com/FoziaAkhtar/iOSApp6.git

🔮 Future Improvements

Possible future enhancements:

User profile screen
Recipe categories filter
Offline recipe caching
Dark mode support
Push notifications
Meal planning feature
Sharing recipes
Improved UI animations
👩‍💻 Developer

Fozia Akhtar

Information Technology Student

SwiftUI | Firebase | Mobile Application Development

📄 License

This project was created for educational purposes.
