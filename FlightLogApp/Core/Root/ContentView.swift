//
//  ContentView.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/6/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                FlightLogsListView()
            } else {
                WelcomeView()
            }
        }
    }
}

