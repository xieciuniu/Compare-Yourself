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
    var name: String
    var measurements: [Measurement]
    
    init(name: String) {
        self.name = name
        self.measurements = []
    }
}
