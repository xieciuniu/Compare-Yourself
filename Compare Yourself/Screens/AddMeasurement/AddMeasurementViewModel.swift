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
    
    func setLastMeasurementValue(measurementPointId: UUID) async {
        do {
            if let lastValue = try repository.getLatestMeasurementForPoint(measurementPointId)?.value {
                self.hundredsDigit = Int(lastValue) / 100
                self.tensDigit = (Int(lastValue) / 10) % 10
                self.onesDigit = Int(lastValue) % 10
                self.oneOfTensDigit = Int(lastValue * 10) % 10
            }
        } catch {
            print("Failed to calculate last measurement digits")
        }
    }
    
    var notes: String = ""
    
    func addMeasurement(mp: MeasurementPoint) {
        let value = createValue()
        let measurement = Measurement(
            value: value,
            notes: notes,
            date: Date(),
            measurementPoint: mp
        )
        
        do {
            try repository.create(measurement)
        } catch {
            print("Failed to add measurement")
        }
    }
    
    func createValue() -> Double {
        return Double(hundredsDigit) * 100 + Double(tensDigit) * 10 + Double(onesDigit) + Double(oneOfTensDigit) / 10
    }
    
    func getLastMeasurementValue(measurementPointId: UUID) async throws-> Double {
        do {
            return try self.repository.getLatestMeasurementForPoint(measurementPointId)?.value ?? 0
        } catch {
            
        }
        
        return 0
    }
}
