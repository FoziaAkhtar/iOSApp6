
// ===========================================================
//  WelcomeView.swift
//  iOSApp6
// ===========================================================
//  Created by Fozia Akhtar
// ===========================================================
//  Purpose:
//  Displays the application's welcome screen.
//
//  Provides users with:
//  • Application introduction
//  • Login button
//  • Create Account button
// ===========================================================
//  Learning Outcomes:
//  ✓ SwiftUI Navigation
//  ✓ NavigationLink
//  ✓ Responsive Layout
//  ✓ Image Assets
// ===========================================================

import SwiftUI

struct WelcomeView: View {

    var body: some View {

        NavigationStack {

            VStack(spacing: 30) {

                Spacer()

                // -------------------------------------------------------
                // App Icon
                // -------------------------------------------------------

                Image(systemName: "fork.knife.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 130)
                    .foregroundStyle(.orange)

                // -------------------------------------------------------
                // Application Title
                // -------------------------------------------------------

                Text("Recipe Finder")
                    .font(.largeTitle)
                    .bold()

                Text("Discover delicious recipes from around the world using TheMealDB API.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)

                Spacer()

                // -------------------------------------------------------
                // Login Button
                // -------------------------------------------------------

                NavigationLink {

                    LoginView()

                } label: {

                    Text("Login")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)

                // -------------------------------------------------------
                // Register Button
                // -------------------------------------------------------

                NavigationLink {

                    RegisterView()

                } label: {

                    Text("Create Account")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.bordered)

            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}

#Preview {

    WelcomeView()
}
