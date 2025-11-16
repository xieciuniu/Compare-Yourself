//
//  MeasurementModelTests.swift
//  Compare YourselfTests
//
//  Created by Hubert Wojtowicz on 16/11/2025.
//

import XCTest
import SwiftData
@testable import Compare_Yourself

final class MeasurementModelTests: XCTestCase {
    
    var container: ModelContainer!
    var context: ModelContext!

    override func setUpWithError() throws {
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
    }

    override func tearDownWithError() throws {
        self.container = nil
        self.context = nil
    }

    // MARK: - MeasurementPoint Tests
    
    func testMeasurementPointInitialization() throws {
        let measurementPoint = MeasurementPoint(name: "Bicep")
        
        XCTAssertEqual(measurementPoint.name, "Bicep")
        XCTAssertTrue(measurementPoint.measurements.isEmpty)
    }
    
    func testMeasurementPointPersistence() throws {
        let measurementPoint = MeasurementPoint(name: "Chest")
        
        context.insert(measurementPoint)
        try context.save()
        
        let fetchDescriptor = FetchDescriptor<MeasurementPoint>()
        let fetchedPoints = try context.fetch(fetchDescriptor)
        
        XCTAssertEqual(fetchedPoints.count, 1)
        XCTAssertEqual(fetchedPoints.first?.name, "Chest")
    }
    
    func testMeasurementPointNameUpdate() throws {
        let measurementPoint = MeasurementPoint(name: "Waist")
        context.insert(measurementPoint)
        
        measurementPoint.name = "Waistline"
        try context.save()
        
        let fetchDescriptor = FetchDescriptor<MeasurementPoint>()
        let fetchedPoints = try context.fetch(fetchDescriptor)
        
        XCTAssertEqual(fetchedPoints.first?.name, "Waistline")
    }
    
    // MARK: - Measurement Tests
    
    func testMeasurementInitialization() throws {
        let measurementPoint = MeasurementPoint(name: "Arm")
        let testDate = Date()
        
        let measurement = Measurement(
            value: 35.5,
            unit: .length,
            notes: "Morning measurement",
            date: testDate,
            measurementPoint: measurementPoint
        )
        
        XCTAssertEqual(measurement.value, 35.5, accuracy: 0.001)
        XCTAssertEqual(measurement.unit, .length)
        XCTAssertEqual(measurement.notes, "Morning measurement")
        XCTAssertEqual(measurement.date, testDate)
        XCTAssertEqual(measurement.measurementPoint.name, "Arm")
    }
    
    func testMeasurementInitializationWithoutNotes() throws {
        let measurementPoint = MeasurementPoint(name: "Thigh")
        let testDate = Date()
        
        let measurement = Measurement(
            value: 55.2,
            unit: .weight,
            date: testDate,
            measurementPoint: measurementPoint
        )
        
        XCTAssertEqual(measurement.value, 55.2, accuracy: 0.001)
        XCTAssertEqual(measurement.unit, .weight)
        XCTAssertNil(measurement.notes)
        XCTAssertEqual(measurement.date, testDate)
        XCTAssertEqual(measurement.measurementPoint.name, "Thigh")
    }
    
    // MARK: - Relationship Tests
    
    func testMeasurementPointToMeasurementRelationship() throws {
        let measurementPoint = MeasurementPoint(name: "Neck")
        let measurement1 = Measurement(
            value: 38.0,
            unit: .length,
            date: Date(),
            measurementPoint: measurementPoint
        )
        let measurement2 = Measurement(
            value: 38.5,
            unit: .length,
            date: Date().addingTimeInterval(86400), // Next day
            measurementPoint: measurementPoint
        )
        
        measurementPoint.measurements.append(measurement1)
        measurementPoint.measurements.append(measurement2)
        
        context.insert(measurementPoint)
        context.insert(measurement1)
        context.insert(measurement2)
        try context.save()
        
        let fetchDescriptor = FetchDescriptor<MeasurementPoint>()
        let fetchedPoints = try context.fetch(fetchDescriptor)
        
        XCTAssertEqual(fetchedPoints.count, 1)
        XCTAssertEqual(fetchedPoints.first?.measurements.count, 2)
        
        let sortedMeasurements = fetchedPoints.first?.measurements.sorted { $0.date < $1.date }
        XCTAssertEqual(sortedMeasurements?.first?.value, (38.0 as Double?))
        XCTAssertEqual(sortedMeasurements?.last?.value, (38.5 as Double?))
    }
    
    func testMeasurementToMeasurementPointRelationship() throws {
        let measurementPoint = MeasurementPoint(name: "Calf")
        let measurement = Measurement(
            value: 32.5,
            unit: .length,
            date: Date(),
            measurementPoint: measurementPoint
        )
        
        context.insert(measurementPoint)
        context.insert(measurement)
        try context.save()
        
        let fetchDescriptor = FetchDescriptor<Compare_Yourself.Measurement>()
        let fetchedMeasurements = try context.fetch(fetchDescriptor)
        
        XCTAssertEqual(fetchedMeasurements.count, 1)
        XCTAssertEqual(fetchedMeasurements.first?.measurementPoint.name, "Calf")
    }
    
    // MARK: - Data Validation Tests
    
    func testMeasurementUnitEnum() throws {
        XCTAssertEqual(MeasurementUnit.length.rawValue, "length")
        XCTAssertEqual(MeasurementUnit.weight.rawValue, "weight")
        
        let lengthUnit = MeasurementUnit(rawValue: "length")
        let weightUnit = MeasurementUnit(rawValue: "weight")
        let invalidUnit = MeasurementUnit(rawValue: "invalid")
        
        XCTAssertEqual(lengthUnit, .length)
        XCTAssertEqual(weightUnit, .weight)
        XCTAssertNil(invalidUnit)
    }

}
