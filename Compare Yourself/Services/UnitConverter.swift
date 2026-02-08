//
//  UnitConverter.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 01/02/2026.
//

import Foundation

struct UnitConverter {
    static func inchesToCentimeters(_ inches: Double) -> Double {
        return inches * 2.54
    }
    
    static func centimetersToInches(_ cm: Double) -> Double {
        return cm / 2.54
    }
    
    static func inchesToFeetAndInches(_ totalInches: Double) -> (feet: Int, inches: Double) {
        let feet = Int(totalInches / 12)
        let remainingInches = totalInches.truncatingRemainder(dividingBy: 12)
        
        return (feet, remainingInches)
    }
    
    static func feetAndInchesToTotalInches(feet: Int, inches: Double) -> Double {
        return Double(feet * 12) + inches
    }
}
