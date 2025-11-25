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
    var measurements: [Measurement]
    // Variable for placement on diagram0
    var xPosition: Double?
    var yPosition: Double?
    var isActive: Bool
    
    init(name: String) {
        self.name = name
        self.measurements = []
        self.isActive = true
    }
}
