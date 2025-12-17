//
//  AddWeightViewModel.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 13/12/2025.
//

import Foundation

@Observable
class AddWeightViewModel {
    var weight: Double = 0.0
    var repository: MeasurementRepository
    
    init(repository: MeasurementRepository) {
        self.repository = repository
    }
}
