//
//  ContentView.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/6/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            if authViewModel.isUserAuthenticated {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
