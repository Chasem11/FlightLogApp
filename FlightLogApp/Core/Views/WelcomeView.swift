//
//  WelcomeView.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/7/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                // Your app's logo or any welcome text can go here
                Text("Welcome to FlightLog")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
                // Navigation to LoginView
                NavigationLink(destination: LoginView(), label: {
                    Text("Log In")
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                // Navigation to SignupView
                NavigationLink(destination: RegistrationView(), label: {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                })
                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    WelcomeView()
}
