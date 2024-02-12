//
//  NumberFormatter.swift
//  FlightLogApp
//
//  Created by Chase Moffat on 2/11/24.
//

import Foundation

extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0 
        formatter.maximumFractionDigits = 2
        return formatter
    }
}
