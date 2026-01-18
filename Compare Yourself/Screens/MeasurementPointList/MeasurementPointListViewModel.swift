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
    
    init(repository: MeasurementPointRepository) {
        self.repository = repository
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
    
}
