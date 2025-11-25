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
    var unit: MeasurementUnit
    var notes: String?
    var date: Date
    var measurementPoint: MeasurementPoint
    
    init(
        value: Double,
        unit: MeasurementUnit,
        notes: String? = nil,
        date: Date,
        measurementPoint: MeasurementPoint
    ) {
        self.value = value
        self.unit = unit
        self.notes = notes
        self.date = date
        self.measurementPoint = measurementPoint
    }
    
}

enum MeasurementUnit: String, Codable {
    case length
    case weight
}
