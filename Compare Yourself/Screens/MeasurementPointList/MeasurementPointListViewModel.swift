//
//  MeasurementPointListViewModel.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 18/01/2026.
//

import Foundation

@Observable
class MeasurementPointListViewModel {
    private var repository: MeasurementPointRepository
    private var measurementRepository: MeasurementRepository
    
    init(repository: MeasurementPointRepository, measurementRepository: MeasurementRepository) {
        self.repository = repository
        self.measurementRepository = measurementRepository
    }
    
    var measurementPoints: [MeasurementPoint] = []
    var isLoading: Bool = true
    var showingAddPoint: Bool = false
    
    func fetchMeasurementPoints() async {
        isLoading = true
        print("Fetching is starting")
        do {
            try measurementPoints = await repository.getAll()
            isLoading = false
            print("Fetching ended")
        } catch {
            print("failed to fetch measurement points \(error)")
        }
    }
    
    
    // TODO: Fix delete measurement Point 
    func deleteMeasurementPoint(at offsets: IndexSet) async {
        do {
            for index in offsets {
                try await repository.delete(measurementPoints[index])
            }
            await fetchMeasurementPoints()
        } catch {
            print("Failed to delete measurement point: \(error)")
        }  
    }
}
