//
//  FlightLogViewModel.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/18/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


extension Notification.Name {
    static let newFlightLog = Notification.Name("newFlighLog")
}

class FlightLogsViewModel: ObservableObject {
    @Published var flightLogs: [LogEntry] = []
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        NotificationCenter.default.addObserver(forName: .newFlightLog, object: nil, queue: .main) { [weak self] _ in
            
            guard let self = self else {return}
            Task {
                await self.fetchFlightLogs()
            }
        }
        
        Task {
            await fetchFlightLogs()
        }
    }
    
    func fetchFlightLogs() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()

        do {
            let querySnapshot = try await db.collection("flightLogs")
                .whereField("userId", isEqualTo: uid) // Filter by user UID
                .order(by: "date", descending: true)
                .getDocuments()

            DispatchQueue.main.async {
                self.flightLogs = querySnapshot.documents.compactMap { document in
                    try? document.data(as: LogEntry.self)
                }
            }
        } catch {
            print("Error fetching flight logs: \(error.localizedDescription)")
        }
    }
    
    static func postFlightLog(logEntry: LogEntry) async throws {
        do {
            // Ensure Firestore.firestore() is called within do-catch to handle potential errors
            let db = Firestore.firestore()
            
            // No need for a continuation here as we're directly within an async context
            print("Attempting to save log entry: \(logEntry)")
            // Encode the log entry to Firestore compatible format
            let encodedLogEntry = try Firestore.Encoder().encode(logEntry)
            // Use the encodedLogEntry directly with setData
            try await db.collection("flightLogs").document(logEntry.id ?? UUID().uuidString).setData(encodedLogEntry)
            
            NotificationCenter.default.post(name: .newFlightLog, object: nil)
            // await fetchLogs() // Example: Fetch updated logs list
        } catch {
            // Handle or throw the error
            print("Debug: Failed to post flight log with error \(error.localizedDescription)")
            throw error // Rethrowing the error to be handled by the caller
        }
    }
}

