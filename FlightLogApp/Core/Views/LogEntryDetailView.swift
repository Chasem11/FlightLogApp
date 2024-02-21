//
//  LogEntryDetailView.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/18/24.
//

import SwiftUI

struct LogEntryDetailView: View {
    var logEntry: LogEntry
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Date: \(logEntry.date, style: .date)").bold()
                Text("Aircraft Make and Model: \(logEntry.aircraftMakeModel)").bold()
                Text("Aircraft Identification: \(logEntry.aircraftIdentification)").bold()
                Text("Departure Point: \(logEntry.departurePoint)").bold()
                Text("Arrival Point: \(logEntry.arrivalPoint)").bold()
                Text("Total Hours: \(logEntry.totalHours, specifier: "%.1f")").bold()
                Text("PIC Time: \(logEntry.picTime, specifier: "%.1f")").bold()
                if let nightTime = logEntry.nightTime {
                    Text("Night Time: \(nightTime, specifier: "%.1f")").bold()
                }
                if let instrumentTime = logEntry.instrumentTime {
                    Text("Instrument Time: \(instrumentTime, specifier: "%.1f")").bold()
                }
                if let landingsDay = logEntry.landingsDay {
                    Text("Day Landings: \(landingsDay)").bold()
                }
                if let landingsNight = logEntry.landingsNight {
                    Text("Night Landings: \(landingsNight)").bold()
                }
            }
            .padding()
        }
        .navigationTitle("Log Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

