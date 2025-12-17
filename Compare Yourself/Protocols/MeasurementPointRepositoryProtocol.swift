//
//  MeasurementPointRepositoryProtocol.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 22/11/2025.
//

import Foundation

protocol MeasurementPointRepositoryProtocol {
    // Basic CRUD operation
    func create(_ point: MeasurementPoint) async throws
    func getAll() async throws -> [MeasurementPoint]
    func save() async throws
    func delete(_ point: MeasurementPoint) async throws
    
    // Specific queries
    func getActiveMeasurementPoints() async throws -> [MeasurementPoint]
    func findByName(_ name: String) async throws -> MeasurementPoint?
}
