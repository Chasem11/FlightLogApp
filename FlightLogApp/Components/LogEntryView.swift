//
//  LogEntryView.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/11/24.
//

import SwiftUI

struct LogEntryView: View {
    @State private var userId = ""
    @State private var selectedDate = Date()
    @State private var aircraftMakeModel = ""
    @State private var aircraftIdentification = ""
    @State private var departurePoint = ""
    @State private var arrivalPoint = ""
    @State private var totalHours: Double = 0
    @State private var picTime: Double = 0
    @State private var nightTime: Double = 0
    @State private var instrumentTime: Double = 0
    @State private var landingsDay: Int = 0
    @State private var landingsNight: Int = 0
    @EnvironmentObject var viewModel: FlightLogsViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("Placholder.logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 120)
                        .padding(.vertical, 32)
                    
                    VStack(spacing: 24) {
                        
                        DatePicker(
                            "Flight Date",
                            selection: $selectedDate,
                            displayedComponents: .date
                        )
                        .padding()
                        
                        InputView(text: $aircraftMakeModel,
                                  title: "Aircraft Make & Model",
                                  placeholder: "Enter the Make & Model")
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        
                        InputView(text: $aircraftIdentification,
                                  title: "Aircraft ID",
                                  placeholder: "Enter the ID")
                        
                        InputView(text: $departurePoint,
                                  title: "Departure Point",
                                  placeholder: "Enter the Departure Point")
                        
                        InputView(text: $arrivalPoint,
                                  title: "Arrival Point",
                                  placeholder: "Enter the Arrival Point")
                        
                        DoubleInputView(value: $totalHours,
                                        label: "Total Hours",
                                        placeholder: "Enter Total Hours")
                        
                        DoubleInputView(value: $picTime,
                                        label: "Pilot In Command Time",
                                        placeholder: "Enter PIC Time")
                        
                        DoubleInputView(value: $nightTime,
                                        label: "Night Time Hours",
                                        placeholder: "Enter Night Time Hours")
                        
                        DoubleInputView(value: $instrumentTime,
                                        label: "Instrument Time",
                                        placeholder: "Enter Instrument Time")
                        
                        IntInputView(value: $landingsDay,
                                     label: "Day Landings",
                                     placeholder: "Enter Day Landings")
                        
                        IntInputView(value: $landingsNight,
                                     label: "Night Landings",
                                     placeholder: "Enter Night Landings")
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    Button {
                        Task {
                            do {
                                if let currentUserUID = viewModel.userSession?.uid {
                                    let newLogEntry = LogEntry(id: UUID().uuidString,
                                                               userId: currentUserUID,
                                                               date: selectedDate,
                                                               aircraftMakeModel: aircraftMakeModel,
                                                               aircraftIdentification: aircraftIdentification,
                                                               departurePoint: departurePoint,
                                                               arrivalPoint: arrivalPoint,
                                                               totalHours: totalHours,
                                                               picTime: picTime,
                                                               nightTime: nightTime,
                                                               instrumentTime: instrumentTime,
                                                               landingsDay: landingsDay,
                                                               landingsNight: landingsNight)
                                    
                                    try await FlightLogsViewModel.postFlightLog(logEntry: newLogEntry)
                                    presentationMode.wrappedValue.dismiss()
                                } else {
                                    print("No current user UID found")
                                }
                            } catch {
                                // Handle the error
                                print("An error occurred: \(error.localizedDescription)")
                            }
                        }
                    } label: {
                        HStack {
                            Text("Submit")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                    }
                    .background(Color(.systemBlue))
                    //.disabled(!formIsVaild)
                    //.opacity(formIsVaild ? 1.0 : 0.5)
                    .cornerRadius(10)
                    .padding(.top, 24)
                    
                }
            }
        }
    }
}

#Preview {
    LogEntryView()
}




