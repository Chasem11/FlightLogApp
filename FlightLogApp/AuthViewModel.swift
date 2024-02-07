//
//  AuthViewModel.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/6/24.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            // Handle successful login, such as updating the UI or changing app state
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            // Handle successful sign-up
        }
    }
}
