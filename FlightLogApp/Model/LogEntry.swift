//
//  LogEntry.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/11/24.
//

import Foundation
import FirebaseFirestoreSwift


struct LogEntry: Identifiable, Codable {
    @DocumentID var id: String?
    var date: Date
    var aircraftMakeModel: String
    var aircraftIdentification: String
    var departurePoint: String
    var arrivalPoint: String
    var totalHours: Double
    var picTime: Double  // Pilot in Command Time
    var nightTime: Double?
    var instrumentTime: Double?
    var landingsDay: Int?
    var landingsNight: Int?
    

    enum CodingKeys: String, CodingKey {
        case id
        case date
        case aircraftMakeModel = "aircraft_make_model"
        case aircraftIdentification = "aircraft_identification"
        case departurePoint = "departure_point"
        case arrivalPoint = "arrival_point"
        case totalHours = "total_hours"
        case picTime = "pic_time"
        case nightTime = "night_time"
        case instrumentTime = "instrument_time"
        case landingsDay = "landings_day"
        case landingsNight = "landings_night"
    }
}
