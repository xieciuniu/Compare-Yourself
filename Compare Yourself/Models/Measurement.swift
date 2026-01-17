//
//  Measurement.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 16/11/2025.
//

import Foundation
import SwiftData

@Model
class Measurement {
    var measurementId = UUID()
    var value: Double
    var notes: String?
    var date: Date
    var measurementPoint: MeasurementPoint
    
    init(
        value: Double,
        notes: String? = nil,
        date: Date,
        measurementPoint: MeasurementPoint
    ) {
        self.value = value
        self.notes = notes
        self.date = date
        self.measurementPoint = measurementPoint
    }
    
}

