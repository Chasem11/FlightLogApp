//
//  LoginView.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/6/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel // Assuming you have an AuthViewModel for handling auth
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Log In") {
                    viewModel.login(email: email, password: password)
                }
                .padding()
                
                NavigationLink("Don't have an account? Sign Up", destination: SignUpView())
                    .padding()
            }
            .navigationTitle("Log In")
        }
    }
}
