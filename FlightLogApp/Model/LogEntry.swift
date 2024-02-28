//
//  LogEntry.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/11/24.
//

import Foundation
import FirebaseFirestoreSwift


struct LogEntry: Identifiable, Codable {
    let id: String?
    let userId: String
    let date: Date
    let aircraftMakeModel: String
    let aircraftIdentification: String
    let departurePoint: String
    let arrivalPoint: String
    let totalHours: Double
    let picTime: Double  // Pilot in Command Time
    let nightTime: Double
    let instrumentTime: Double
    let landingsDay: Int
    let landingsNight: Int
}

extension LogEntry {
    static var MOCK_LOG = LogEntry(id: NSUUID().uuidString,userId: NSUUID().uuidString, date: Date(), aircraftMakeModel: "Nimbus", aircraftIdentification: "CHXZ", departurePoint: "MIA", arrivalPoint: "JFK", totalHours: 6, picTime: 6, nightTime: 2, instrumentTime: 3, landingsDay: 1, landingsNight: 2)
}
