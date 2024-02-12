//
//  LogEntryView.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/11/24.
//

import SwiftUI

struct LogEntryView: View {
    @Binding var logEntry: LogEntry

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Date")
                    .bold()
                DatePicker("Date", selection: $logEntry.date, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()

                Text("Aircraft Make and Model")
                    .bold()
                TextField("", text: $logEntry.aircraftMakeModel)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Aircraft Identification")
                    .bold()
                TextField("", text: $logEntry.aircraftIdentification)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Departure Point")
                    .bold()
                TextField("", text: $logEntry.departurePoint)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Text("Arrival Point")
                    .bold()
                TextField("", text: $logEntry.arrivalPoint)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                // Assuming DoubleInputView is a custom component that handles Double inputs
                Text("Total Hours")
                    .bold()
                DoubleInputView(value: Binding(get: { logEntry.totalHours }, set: { logEntry.totalHours = $0 }), label: "", placeholder: "e.g., 5.5")

                Text("PIC Time")
                    .bold()
                DoubleInputView(value: Binding(get: { logEntry.picTime }, set: { logEntry.picTime = $0 }), label: "", placeholder: "e.g., 4.0")

                // Optional Double values
                if let _ = logEntry.nightTime {
                    Text("Night Time")
                        .bold()
                    DoubleInputView(value: Binding(get: { logEntry.nightTime ?? 0 }, set: { logEntry.nightTime = $0 }), label: "", placeholder: "e.g., 2.0")
                }

                if let _ = logEntry.instrumentTime {
                    Text("Instrument Time")
                        .bold()
                    DoubleInputView(value: Binding(get: { logEntry.instrumentTime ?? 0 }, set: { logEntry.instrumentTime = $0 }), label: "", placeholder: "e.g., 1.5")
                }

                // Assuming IntInputView is a custom component that handles Int inputs
                if let _ = logEntry.landingsDay {
                    Text("Day Landings")
                        .bold()
                    IntInputView(value: Binding(get: { logEntry.landingsDay ?? 0 }, set: { logEntry.landingsDay = $0 }), label: "", placeholder: "e.g., 3")
                }

                if let _ = logEntry.landingsNight {
                    Text("Night Landings")
                        .bold()
                    IntInputView(value: Binding(get: { logEntry.landingsNight ?? 0 }, set: { logEntry.landingsNight = $0 }), label: "", placeholder: "e.g., 1")
                }
            }
        }
        .padding()
    }
}

struct LogEntryView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample LogEntry instance
        let sampleLogEntry = LogEntry(
            date: Date(),
            aircraftMakeModel: "Cessna 172",
            aircraftIdentification: "N123AB",
            departurePoint: "KJFK",
            arrivalPoint: "KLAX",
            totalHours: 5.5,
            picTime: 4.5,
            nightTime: 2.0,
            instrumentTime: 1.0,
            landingsDay: 3,
            landingsNight: 1
        )
        
        // Use the .constant modifier to create a binding for the preview
        LogEntryView(logEntry: .constant(sampleLogEntry))
            .previewLayout(.sizeThatFits)
    }
}
