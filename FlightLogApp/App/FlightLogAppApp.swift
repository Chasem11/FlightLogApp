//
//  FlightLogAppApp.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/6/24.
//

import SwiftUI
import FirebaseCore
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct FlightLogAppApp: App {
    @StateObject var viewModel = AuthViewModel()
    @StateObject var flightLogsViewModel = FlightLogsViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(flightLogsViewModel)
        }
    }
}

