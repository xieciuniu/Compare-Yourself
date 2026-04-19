//
//  DependencyContainer.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 06/01/2026.
//

import Foundation
import SwiftData
import Combine

final class DependencyContainer: ObservableObject {
    @Published var userPreferences: UserPreferences
    private(set) var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.userPreferences = UserPreferences()
        self.modelContext = modelContext
    }
    
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
    
    func makeMeasurementPointViewModel() -> MeasurementPointViewModel {
        MeasurementPointViewModel(measurementRepository: measurementRepository)
    }
    
    func makeMeasurementPointListViewModel() -> MeasurementPointListViewModel {
        MeasurementPointListViewModel(repository: measurementPointRepository, measurementRepository: measurementRepository)
    }
}

extension DependencyContainer {
    static func preview() -> DependencyContainer {
        let schema = Schema([MeasurementPoint.self, Measurement.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let mc = try! ModelContainer(for: schema, configurations: [config])
        return DependencyContainer(modelContext: ModelContext(mc))
    }
}
