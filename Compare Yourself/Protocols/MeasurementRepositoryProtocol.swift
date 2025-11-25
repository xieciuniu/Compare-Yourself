//
//  MeasurementRepositoryProtocol.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 22/11/2025.
//

import Foundation

protocol MeasurementRepositoryProtocol {
    func create(_ measurement: Measurement) throws
    func getAll() throws -> [Measurement]
    func update(_ measurementId: UUID, value: Double?, unit: MeasurementUnit?, notes: String?, date: Date?, measurementPoint: MeasurementPoint?) throws
    func delete(_ measurement: Measurement) throws
    
    func getMeasurementsForPoint(_ pointId: UUID) throws -> [Measurement]
    func getMeasurementsInDateRange(pointId: UUID, from: Date, to: Date) throws -> [Measurement]
    func getLatestMeasurementForPoint(_ pointId: UUID) throws -> Measurement?
    func getLatestMeasurementForPoints(_ pointsId: [UUID]) throws -> [Measurement]
}
