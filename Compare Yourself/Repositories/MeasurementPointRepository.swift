//
//  MeasurementPointRepository.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 22/11/2025.
//

import Foundation
import SwiftData

class MeasurementPointRepository: MeasurementPointRepositoryProtocol {
    private var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func create(_ point: MeasurementPoint) async throws {
        context.insert(point)
        try context.save()
    }
    
    func getAll() async throws -> [MeasurementPoint] {
        let fetchDescriptor = FetchDescriptor<MeasurementPoint>()
        let fetched = try context.fetch(fetchDescriptor)
        return fetched
    }
    
    func save() async throws {
        try context.save()
    }
    
    func delete(_ point: MeasurementPoint) async throws {
        context.delete(point)
        try context.save()
    }
    
    func getActiveMeasurementPoints() async throws -> [MeasurementPoint] {
        let fetchDescriptor = FetchDescriptor<MeasurementPoint>(
            predicate: #Predicate { $0.isActive }
        )
        let fetched = try context.fetch(fetchDescriptor)
        return fetched
    }
    
    func getInactiveMeasurementPoints() async throws -> [MeasurementPoint] {
        let fetchDescriptor = FetchDescriptor<MeasurementPoint>(
            predicate: #Predicate { !$0.isActive }
        )
        let fetched = try context.fetch(fetchDescriptor)
        return fetched
    }
    
    func findByName(_ name: String) async throws -> [MeasurementPoint] {
        let fetchDescriptor = FetchDescriptor<MeasurementPoint>(
            predicate: #Predicate { $0.name == name }
        )
        let fetched = try context.fetch(fetchDescriptor)
        return fetched
    }
    
    func findById(_ id: UUID) async throws -> MeasurementPoint? {
        let fetchDescriptor = FetchDescriptor<MeasurementPoint>(
            predicate: #Predicate { $0.pointId == id }
        )
        let fetched = try context.fetch(fetchDescriptor).first
        return fetched
    }
}
