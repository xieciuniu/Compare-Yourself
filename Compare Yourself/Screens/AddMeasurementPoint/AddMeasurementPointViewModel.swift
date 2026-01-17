//
//  AddMeasurementPointViewModel.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 11/01/2026.
//

import Foundation

@Observable
class AddMeasurementPointViewModel {
    // MARK: Dependency
    private let repository: MeasurementPointRepository
    
    init(repository: MeasurementPointRepository, measurementPoint: MeasurementPoint? = nil) {
        self.repository = repository
        if let measurementPoint {
            self.name = measurementPoint.name
            self.xPosition = measurementPoint.xPosition
            self.yPosition = measurementPoint.yPosition
            self.measurementUnit = measurementPoint.measurementUnit
        }
    }
    
    // MARK: Properties
    var name: String = ""
    var xPosition: Double? = 0.0
    var yPosition: Double? = 0.0
    var measurementUnit: MeasurementUnit = .length
    
    // MARK: Validation
    // Nah, IDK if just making it disable would be good UX, it need to be also visible why it's turned off
    var canSave: Bool {
        name.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    // MARK: Actions
    func updatePinPosition(x: Double, y: Double) {
        xPosition = x
        yPosition = y
    }
    
    func saveMeasurementPoint() async -> Bool {
        guard canSave else { return false }
        do {
            try await repository.create(createMeasurementPoint())
        } catch {
            print(error)
        }
        return true
    }
    
    func createMeasurementPoint() -> MeasurementPoint {
        MeasurementPoint(
            name: self.name,
            measurementUnit: self.measurementUnit
        )
    }
    
}
