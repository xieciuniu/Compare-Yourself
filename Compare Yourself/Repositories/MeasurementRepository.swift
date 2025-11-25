//
//  MeasurementRepository.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 22/11/2025.
//

import Foundation
import SwiftData

class MeasurementRepository: MeasurementRepositoryProtocol {
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func create(_ measurement: Measurement) throws {
        context.insert(measurement)
        try context.save()
    }
    
    func getAll() throws -> [Measurement] {
        let fetchDescriptor = FetchDescriptor<Measurement>(
            sortBy: [SortDescriptor(\Measurement.date, order: .reverse)]
        )
        let fetched = try context.fetch(fetchDescriptor)
        return fetched
    }
    
    func update(_ measurementId: UUID, value: Double? = nil, unit: MeasurementUnit? = nil, notes: String? = nil, date: Date? = nil, measurementPoint: MeasurementPoint? = nil) throws {
        let fetchDescirptior = FetchDescriptor<Measurement>(
            predicate: #Predicate { $0.measurementId == measurementId },
            sortBy: [ .init(\Measurement.date) ]
        )
        if let measurement = try context.fetch(fetchDescirptior).first {
            if let value {
                measurement.value = value
            }
            if let unit {
                measurement.unit = unit
            }
            if let notes {
                measurement.notes = notes
            }
            if let date {
                measurement.date = date
            }
            if let measurementPoint {
                measurement.measurementPoint = measurementPoint
            }
        }
        
        try context.save()
    }
    
    func delete(_ measurement: Measurement) throws {
        context.delete(measurement)
        try context.save()
    }
    
    func getMeasurementsForPoint(_ pointId: UUID) throws -> [Measurement] {
        let fetchDescripter = FetchDescriptor<Measurement>(
            predicate: #Predicate { $0.measurementPoint.pointId == pointId }
        )
        let fetched = try context.fetch(fetchDescripter)
        
        return fetched
    }
    
    func getMeasurementsInDateRange(pointId: UUID, from: Date, to: Date) throws -> [Measurement] {
        let fetchDescriptor = FetchDescriptor<Measurement>(
            predicate: #Predicate { $0.date >= from && $0.date <= to},
            sortBy:  [ .init(\Measurement.date, order: .reverse) ]
        )
        
        let fetched = try context.fetch(fetchDescriptor)
        
        return fetched
    }
    
    func getLatestMeasurementForPoint(_ pointId: UUID) throws -> Measurement? {
        let fetchDescripter = FetchDescriptor<Measurement>(
            predicate: #Predicate { $0.measurementPoint.pointId == pointId },
            sortBy: [ .init(\Measurement.date, order: .reverse)]
        )
        let fetched = try context.fetch(fetchDescripter)
        return fetched.first
    }
    
    func getLatestMeasurementForPoints(_ pointsId: [UUID]) throws -> [Measurement] {
        var measurements: [Measurement] = []
        for pointId in pointsId {
            if let measurement = try? getLatestMeasurementForPoint(pointId) {
                measurements.append(measurement)
            }
        }
        
        return measurements
    }
    
    
}
