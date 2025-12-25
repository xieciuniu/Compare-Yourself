//
//  MeasurementPointRepositoryTests.swift
//  Compare YourselfTests
//
//  Created by Hubert Wojtowicz on 21/12/2025.
//

import Testing
import SwiftData
@testable import Compare_Yourself
import Foundation

class MeasurementPointRepositoryTests {
    var container: ModelContainer!
    var context: ModelContext!
    var repository: MeasurementPointRepository!
    
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
        
        self.repository = await MeasurementPointRepository(context: context)
    }
    
    deinit {
        self.container = nil
        self.context = nil
    }
    
    @Test func measurementPointRepositoryCreation() async throws {
        let measurementPoint = MeasurementPoint(name: "Test Measurement Point")
        
        try await repository.create(measurementPoint)
        
        let fetchDescriptor = FetchDescriptor<Compare_Yourself.MeasurementPoint>(sortBy: [SortDescriptor(\Compare_Yourself.MeasurementPoint.name)])
        let fetched = try context.fetch(fetchDescriptor)
        let savedMeasurementPoint = fetched.count
        
        #expect(savedMeasurementPoint == 1)
    }
    
    @Test func MPGetAll() async throws {
        let measurementPoint1 = MeasurementPoint(name: "Test Measurement Point 1")
        let measurementPoint2 = MeasurementPoint(name: "Test Measurement Point 2")
        
        try await repository.create(measurementPoint1)
        try await repository.create(measurementPoint2)
        
        let fetched = try await repository.getAll()
        
        #expect(fetched.count == 2)
    }
    
//    @Test func MPSave() async throws {}
    
    @Test func MPDelete() async throws {
        let measurementPoint1 = MeasurementPoint(name: "Test Measurement Point 1")
        let measurementPoint2 = MeasurementPoint(name: "Test Measurement Point 2")
        
        try await repository.create(measurementPoint1)
        try await repository.create(measurementPoint2)
        
        try await repository.delete(measurementPoint1)
        
        let fetched = try await repository.getAll()
        
        #expect(fetched.count == 1)
    }
    
    @Test func MPGetActive() async throws {
        let measurementPoint1 = MeasurementPoint(name: "Test Measurement Point 1")
        let measurementPoint2 = MeasurementPoint(name: "Test Measurement Point 2")
        
        try await repository.create(measurementPoint1)
        try await repository.create(measurementPoint2)
        
        measurementPoint1.isActive = false
        try context.save()
        
        let fetchedActive = try await repository.getActiveMeasurementPoints()
        
        #expect(fetchedActive.count == 1)
    }
    
    @Test func MPGetInactive() async throws {
        let measurementPoint1 = MeasurementPoint(name: "Test Measurement Point 1")
        let measurementPoint2 = MeasurementPoint(name: "Test Measurement Point 2")
        
        try await repository.create(measurementPoint1)
        try await repository.create(measurementPoint2)
        
        measurementPoint1.isActive = false
        try context.save()
        
        let fetchedInactive = try await repository.getInactiveMeasurementPoints()
        
        #expect(fetchedInactive.count == 1)
    }
    
    @Test func MPFindByName() async throws {
        let measurementPoint1 = MeasurementPoint(name: "Test Measurement Point 1")
        let measurementPoint2 = MeasurementPoint(name: "Test Measurement Point 2")
        
        try await repository.create(measurementPoint1)
        try await repository.create(measurementPoint2)
        
        measurementPoint1.isActive = false
        try context.save()
        
        let fetched = try await repository.findByName("Test Measurement Point 1")
        
        #expect(fetched.count == 1)
        #expect(fetched.first?.name == "Test Measurement Point 1")
    }
    
    @Test func MPFindByNameNil() async throws {
        let measurementPoint1 = MeasurementPoint(name: "Test Measurement Point 1")
        let measurementPoint2 = MeasurementPoint(name: "Test Measurement Point 2")
        
        try await repository.create(measurementPoint1)
        try await repository.create(measurementPoint2)
        
        measurementPoint1.isActive = false
        try context.save()
        
        let fetched = try await repository.findByName("Test Measurement Point 3")
        
        #expect(fetched.count == 0)
    }
}
