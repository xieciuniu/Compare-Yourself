//
//  AddMeasurementViewModel.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 06/01/2026.
//

import Foundation

@Observable
class AddMeasurementViewModel {
    var repository: MeasurementRepository
    
    init(repository: MeasurementRepository) {
        self.repository = repository
        
    }
    
    var hundredsDigit: Int = 0
    var tensDigit: Int = 0
    var onesDigit: Int = 0
    var oneOfTensDigit: Int = 0
    var oneOfHundredsDigit: Int = 0
    var metricUnit: String = "cm"
    
    var feetDigit: Int = 0
    var inchesOnesDigit: Int = 0
    var inchesTenthDigit: Int = 0
    
    func setLastMeasurementValue(measurementPointId: UUID, measurementSystem: MeasurementSystem, measurementType: MeasurementUnit) async {
        do {
            if let lastValue = try repository.getLatestMeasurementForPoint(measurementPointId)?.value {
                if measurementSystem == .imperial && measurementType == .length {
                    let totalInches = UnitConverter.centimetersToInches(lastValue)
                    (self.feetDigit, self.inchesOnesDigit, self.inchesTenthDigit) = UnitConverter.inchesToFeetAndInchesAndDecimal(totalInches)
                } else if measurementSystem == .imperial && measurementType == .weight {
                    let lastValueLbs = UnitConverter.kilogramsToPounds(lastValue)
            
                    self.hundredsDigit = Int(lastValueLbs) / 100
                    self.tensDigit = (Int(lastValueLbs) / 10) % 10
                    self.onesDigit = Int(lastValueLbs) % 10
                    self.oneOfTensDigit = Int(lastValueLbs * 10) % 10
                } else {
                    self.hundredsDigit = Int(lastValue) / 100
                    self.tensDigit = (Int(lastValue) / 10) % 10
                    self.onesDigit = Int(lastValue) % 10
                    self.oneOfTensDigit = Int(lastValue * 10) % 10
                }
            }
        } catch {
            print("Failed to calculate last measurement digits: \(error)")
        }
        switch measurementType {
        case .length:
            self.metricUnit = "cm"
        case .weight:
            self.metricUnit = measurementSystem == .metric ? "kg" : "lbs"
        case .percentage:
            self.metricUnit = "%"
        }
    }
    
    var notes: String = ""
    
    func addMeasurement(mp: MeasurementPoint, measurementSystem: MeasurementSystem, measurementType: MeasurementUnit) {
        let value: Double
        if measurementSystem == .imperial && measurementType == .length {
            value = createValueFootInch()
        } else if measurementSystem == .imperial && measurementType == .weight {
            value = createValuePounds()
        } else {
            value = createValueBaseTen()
        }
        let measurement = Measurement(
            value: value,
            notes: notes,
            date: Date(),
            measurementPoint: mp
        )
        
        do {
            try repository.create(measurement)
            mp.dateOfLastUpdate = Date()
        } catch {
            print("Failed to add measurement")
        }
    }
    
    func createValueBaseTen() -> Double {
        return Double(hundredsDigit) * 100 + Double(tensDigit) * 10 + Double(onesDigit) + Double(oneOfTensDigit) / 10
    }
    
    func convertToInches() -> Double {
        let inchesDecimal = Double(inchesTenthDigit) / 10 + Double(inchesOnesDigit)
        return UnitConverter.feetAndInchesToTotalInches(feet: feetDigit, inches: inchesDecimal)
    }
    
    func createValueFootInch() -> Double {
        return UnitConverter.inchesToCentimeters(convertToInches())
    }
    
    func createValuePounds() -> Double {
        return UnitConverter.poundsToKilograms(createValueBaseTen())
    }
    
    func getLastMeasurementValue(measurementPointId: UUID) async throws-> Double {
        do {
            return try self.repository.getLatestMeasurementForPoint(measurementPointId)?.value ?? 0
        } catch {
            
        }
        
        return 0
    }
}
