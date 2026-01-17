//
//  DependencyContainer.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 06/01/2026.
//

import Foundation
import SwiftData

final class DependencyContainer {
    lazy var modelContext: ModelContext = {
        let schema = Schema([
            MeasurementPoint.self,
            Measurement.self,
        ])
        let configuration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )
        do {
            let container = try ModelContainer(
                for: schema,
                configurations: configuration
            )
            return ModelContext(container)
        } catch {
            fatalError("Failed to create ModelContext: \(error)")
        }
    }()
    
    lazy var measurementRepository: MeasurementRepository = {
        MeasurementRepository(context: modelContext)
    }()
    lazy var measurementPointRepository: MeasurementPointRepository = {
        MeasurementPointRepository(context: modelContext)
    }()
    
    func makeAddMeasurementViewModel() -> AddMeasurementViewModel {
        AddMeasurementViewModel(repository: measurementRepository)
    }
    
    func makeAddMeasurementPointViewModel() -> AddMeasurementPointViewModel {
        AddMeasurementPointViewModel(repository: measurementPointRepository)
    }
}
