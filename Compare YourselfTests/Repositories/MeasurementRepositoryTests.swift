//
//  MeasurementRepositoryTests.swift
//  Compare YourselfTests
//
//  Created by Hubert Wojtowicz on 22/11/2025.
//

import Testing
import SwiftData
@testable import Compare_Yourself
import Foundation

class MeasurementRepositoryTests {
    
    var container: ModelContainer!
    var context: ModelContext!
    var repository: MeasurementRepository!
    
    init() async throws {
        let schema = Schema([
            MeasurementPoint.self,
            Measurement.self
        ])
        let configuration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: true
        )
        self.container = try ModelContainer(
            for: schema,
            configurations: [configuration]
        )
        self.context = ModelContext(container)
        
        self.repository = await MeasurementRepository(context: context)
    }
    
    deinit {
        self.container = nil
        self.context = nil
    }

    @Test func measurementCreation() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let measurementPoint = MeasurementPoint(name: "Measurement Creation test")
        let measurement = Measurement(value: 0.0, unit: .length, date: Date(), measurementPoint: measurementPoint)
        try await repository.create(measurement)
        
        let fetchDescriptor = FetchDescriptor<Compare_Yourself.Measurement>(sortBy: [SortDescriptor(\Compare_Yourself.Measurement.date)])
        let fetched = try context.fetch(fetchDescriptor)
        let savedMeasurementCount = fetched.count
        
        #expect(savedMeasurementCount == 1)
    }
    
    @Test func gettAllMeasurements() async throws {
        let measurementPoint = MeasurementPoint(name: "Measurement Creation test")
        let measurement = Measurement(value: 0.0, unit: .length, date: Date(), measurementPoint: measurementPoint)
        let measurement2 = Measurement(value: 0.0, unit: .length, date: Date(), measurementPoint: measurementPoint)
        try await repository.create(measurement)
        try await repository.create(measurement2)
        
        let fetched = try await repository.getAll()
        
        #expect(fetched.count == 2)
    }
    
    @Test func changeMeasurement() async throws {
        let measurementPoint = MeasurementPoint(name: "Measurement Creation test")
        let measurement = Measurement(value: 0.0, unit: .length, date: Date(), measurementPoint: measurementPoint)
        try await repository.create(measurement)
        
        measurement.value = 10.0
        try await repository.save()
        let fetched = try await repository.getAll().first!
        
        #expect(fetched.value == 10.0)
    }
    
    @Test func deleteMeasurement() async throws {
        let measurementPoint = MeasurementPoint(name: "Measurement Creation test")
        let measurement = Measurement(value: 0.0, unit: .length, date: Date(), measurementPoint: measurementPoint)
        try await repository.create(measurement)
        
        try await repository.delete(measurement)
        let fetched = try await repository.getAll()
        
        #expect(fetched.isEmpty)
    }
    
    @Test func getMeasurementsForPoint() async throws {
        let measurementPoint = MeasurementPoint(name: "Measurement Creation test")
        let measurementPoint2 = MeasurementPoint(name: "Measurement Creation test 2")
        let measurement = Measurement(value: 0.0, unit: .length, date: Date(), measurementPoint: measurementPoint)
        let measurement2 = Measurement(value: 0.0, unit: .length, date: Date(), measurementPoint: measurementPoint2)
        try await repository.create(measurement)
        try await repository.create(measurement2)
        
        let fetchMeasurementsForPoint = try await repository.getMeasurementsForPoint(measurementPoint.pointId)
        
        #expect(fetchMeasurementsForPoint.count == 1)
    }

    @Test func getMearuementsInDateRange() async throws {
        let measurementPoint = MeasurementPoint(name: "Measurement Creation test")
        let measurement = Measurement(value: 0.0, unit: .length, date: Date(), measurementPoint: measurementPoint)
        let measurement2 = Measurement(value: 0.0, unit: .length, date: Date.now.addingTimeInterval(-60), measurementPoint: measurementPoint)
        
        try await repository.create(measurement)
        try await repository.create(measurement2)
        
        let fetched = try await repository.getMeasurementsInDateRange(pointId: measurementPoint.pointId, from: Date.now.addingTimeInterval(-30), to: Date())
        
        #expect(fetched.count == 1)
    }
    
    @Test func getLatestMeasurementForPoint() async throws {
        let measurementPoint = MeasurementPoint(name: "Measurement Creation test")
        let measurement = Measurement(value: 10.0, unit: .length, date: Date(), measurementPoint: measurementPoint)
        let measurement2 = Measurement(value: 0.0, unit: .length, date: Date.now.addingTimeInterval(-60), measurementPoint: measurementPoint)
        let measurement3 = Measurement(value: 5.0, unit: .length, date: Date.now.addingTimeInterval(-20), measurementPoint: measurementPoint)
        
        try await repository.create(measurement)
        try await repository.create(measurement2)
        try await repository.create(measurement3)
        
        let fetched = try await repository.getLatestMeasurementForPoint(measurementPoint.pointId)
        
        #expect(fetched?.value == 10.0)
        #expect(fetched?.measurementId == measurement.measurementId)
    }
    
    @Test func getLatestMeasurementForPoints() async throws {
        let measurementPoint = MeasurementPoint(name: "Measurement Creation test")
        let measurementPoint2 = MeasurementPoint(name: "Measurement Creation test 2")
        let measurement = Measurement(value: 10.0, unit: .length, date: Date(), measurementPoint: measurementPoint)
        let measurement21 = Measurement(value: 11.0, unit: .length, date: Date(), measurementPoint: measurementPoint2)
        let measurement2 = Measurement(value: 0.0, unit: .length, date: Date.now.addingTimeInterval(-60), measurementPoint: measurementPoint)
        let measurement22 = Measurement(value: 0.0, unit: .length, date: Date.now.addingTimeInterval(-60), measurementPoint: measurementPoint2)
        let measurement3 = Measurement(value: 5.0, unit: .length, date: Date.now.addingTimeInterval(-20), measurementPoint: measurementPoint)
        
        try await repository.create(measurement)
        try await repository.create(measurement2)
        try await repository.create(measurement21)
        try await repository.create(measurement22)
        try await repository.create(measurement3)
        
        let fetched = try await repository.getLatestMeasurementForPoints([measurementPoint.pointId, measurementPoint2.pointId])
        for fetch in fetched {
            print(fetch)
        }
        
        #expect(fetched.count == 2)
        #expect(fetched.contains(where: { $0.value == 10.0 }))
        #expect(fetched.contains(where: { $0.value == 11.0 }))
    }
}
