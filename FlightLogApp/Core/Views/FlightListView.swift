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
            List {
                Section(header: Text("Total Times")) {
                    VStack(alignment: .leading) {
                        Text("Total Flight Time: \(viewModel.totalUserHours, specifier: "%.1f") hrs")
                        Text("Total Pilot In Command Time: \(viewModel.totalUserPICTime, specifier: "%.1f") hrs")
                        Text("Total Night Time: \(viewModel.totalUserNightTime, specifier: "%.1f") hrs")
                        Text("Total Instument Time: \(viewModel.totalUserInstumentTime, specifier: "%.1f") hrs")
                    }
                }
                
                ForEach(viewModel.flightLogs) { logEntry in
                    NavigationLink(destination: LogEntryDetailView(logEntry: logEntry)) {
                        HStack {
                            Text(logEntry.date, style: .date)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
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
                LogEntryView()
            }
            .onAppear{
                Task {
                    await viewModel.fetchFlightLogs()
                }
            }
        }
    }
}


struct FlightLogsListView_Previews: PreviewProvider {
    static var previews: some View {
        FlightLogsListView()
    }
}
