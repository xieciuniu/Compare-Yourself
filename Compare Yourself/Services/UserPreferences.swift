//
//  UserPreferences.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 01/02/2026.
//

import Foundation

@Observable
class UserPreferences {
    var measurementSystem: MeasurementSystem {
        didSet {
            UserDefaults.standard.set(measurementSystem.rawValue, forKey: "measurementSystem")
        }
    }
    
    init() {
        let measurementSystemRawValue = UserDefaults.standard.string(forKey: "measurementSystem") ?? "metric"
        self.measurementSystem = .init(rawValue: measurementSystemRawValue) ?? .metric
    }
}
