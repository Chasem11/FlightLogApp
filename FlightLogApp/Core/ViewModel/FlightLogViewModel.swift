//
//  FlightLogViewModel.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/18/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FlightLogsViewModel: ObservableObject {
    @Published var flightLogs: [LogEntry] = []
    
    func fetchFlightLogs() {
        let db = Firestore.firestore()
        db.collection("flightLogs").order(by: "date", descending: true).getDocuments { [weak self] (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self?.flightLogs = querySnapshot!.documents.compactMap { document in
                    try? document.data(as: LogEntry.self)
                }
            }
        }
    }
    
    static func postFlightLog(logEntry: LogEntry, completion: @escaping () -> Void) {
        let db = Firestore.firestore()
        do {
            try db.collection("flightLogs").addDocument(from: logEntry) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    completion()
                }
            }
        } catch let error {
            print("Firestore Serialization Error: \(error)")
        }
    }
}

