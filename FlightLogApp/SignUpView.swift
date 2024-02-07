//
//  SignUpView.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/6/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel // Use the same view model for consistency
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Sign Up") {
                viewModel.signUp(email: email, password: password)
            }
            .padding()
        }
        .navigationTitle("Sign Up")
    }
}
