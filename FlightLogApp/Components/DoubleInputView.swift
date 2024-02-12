//
//  DoubleInputView.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/11/24.
//
import SwiftUI

struct DoubleInputView: View {
    @Binding var value: Double
    let label: String
    let placeholder: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(label)
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                .font(.footnote)
            
            TextField(placeholder, value: $value, formatter: NumberFormatter.decimal)
                .keyboardType(.decimalPad)
                .padding()
            
            Divider()
        }
    }
}


