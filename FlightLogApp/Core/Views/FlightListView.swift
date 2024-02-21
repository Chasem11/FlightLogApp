//
//  FlightListView.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/14/24.
//

import SwiftUI

struct FlightLogsListView: View {
    @StateObject private var viewModel = FlightLogsViewModel()
    @State private var showingAddLogView = false

    var body: some View {
        NavigationView {
            List(viewModel.flightLogs) { logEntry in
                NavigationLink(destination: LogEntryDetailView(logEntry: logEntry)) {
                    HStack {
                        Text(logEntry.date, style: .date)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle("Flight Logs", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                showingAddLogView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddLogView) {
                LogEntryView(logEntry: .constant(LogEntry(date: Date(), aircraftMakeModel: "", aircraftIdentification: "", departurePoint: "", arrivalPoint: "", totalHours: 0, picTime: 0, nightTime: 0, instrumentTime: 0, landingsDay: 0, landingsNight: 0)))
            }
            .onAppear(perform: viewModel.fetchFlightLogs)
        }
    }
}
    


struct FlightLogsListView_Previews: PreviewProvider {
    static var previews: some View {
        FlightLogsListView()
    }
}
