//
//  MeasurementPointViewModel.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 17/01/2026.
//

import Foundation

@Observable
class MeasurementPointViewModel {
    var measurementRepository: MeasurementRepository
    
    init(measurementRepository: MeasurementRepository) {
        self.measurementRepository = measurementRepository
    }
    
    var unitString = ""
    var measurements: [Measurement] = []
    var showingAddPoint: Bool = false
    
    func fetchMeasurements(mpId: UUID) {
        do {
            measurements = try measurementRepository.getMeasurementsForPoint(mpId)
        } catch {
            print("Failed to fetch measurements: \(error)")
        }

        measurements.sort(by: { $0.date > $1.date })
    }
    
    func deleteMeasurement(at offsets: IndexSet, mpId: UUID) async {
        let measurementsToDelete = offsets.map { measurements[$0]}
        
        do {
            for measurement in measurementsToDelete {
                try measurementRepository.delete(measurement)
            }
        } catch {
            print("Failed to delete measurement: \(error)")
        }
        Task {
            fetchMeasurements(mpId: mpId)
        }
    }
    
    func measurementUnitString(measurementSystem: MeasurementSystem, measurementUnit: MeasurementUnit) {
        switch measurementUnit {
        case .length:
            unitString = measurementSystem == .metric ? "cm" : "ft"
        case .weight:
            unitString = measurementSystem == .metric ? "kg" : "lbs"
        case .percentage:
            unitString = "%"
        }
    }

}
