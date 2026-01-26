//
//  MeasurementPoint.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 16/11/2025.
//

import Foundation
import SwiftData

@Model
class MeasurementPoint {
    var pointId = UUID()
    var name: String
    @Relationship(deleteRule: .cascade, inverse: \Measurement.measurementPoint)
    var measurements: [Measurement]
    // Variable for placement on diagram0
    var xPosition: Double?
    var yPosition: Double?
    var isActive: Bool
    var measurementUnit: MeasurementUnit
    
    init(name: String, measurementUnit: MeasurementUnit = .length) {
        self.name = name
        self.measurements = []
        self.isActive = true
        self.measurementUnit = measurementUnit
    }
}


enum MeasurementUnit: String, Codable, CaseIterable, Identifiable {
    case length
    case weight
    case percentage
    
    var id: Self { self }
    
    var description: String {
        switch self {
        case .length:
            return "Length"
        case .weight:
            return "Weight"
        case .percentage:
            return "%"
        }
    }
}
