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
    
    var measurements: [Measurement] = []
    var showingAddPoint: Bool = false
    
    func fetchMeasurements(mpId: UUID) {
        do {
            measurements = try measurementRepository.getMeasurementsForPoint(mpId)
        } catch {
            print("Failed to fetch measurements: \(error)")
        }
    }
    

}
