//
//  MeasurementPointView.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 17/01/2026.
//

import SwiftUI

struct MeasurementPointView: View {
    @EnvironmentObject private var container: DependencyContainer
    
    @State private var vm: MeasurementPointViewModel
    private let mp: MeasurementPoint
    
    init(vm: MeasurementPointViewModel, mp: MeasurementPoint) {
        self.vm = vm
        self.mp = mp
    }
    var body: some View {
        List {
            if vm.measurements.isEmpty {
                ContentUnavailableView {
                    Label("No Measurements", systemImage: "ruler")
                } description: {
                    Text("Add your first measurement for this point")
                }
            } else {
                ForEach(vm.measurements) { measurement in
                    MeasurementRow(measurement: measurement, measurementUnitString: vm.unitString)
                }
                .onDelete { index in
                    Task {
                        await vm.deleteMeasurement(at: index, mpId: mp.pointId)
                    }
                }
            }
        }
        .navigationTitle(mp.name)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    vm.showingAddPoint = true
                } label: {
                    Label("Add", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $vm.showingAddPoint) {
            vm.fetchMeasurements(mpId: mp.pointId)
        } content: {
            AddMeasurement(
                vm: container.makeAddMeasurementViewModel(),
                measurementPoint: mp
            )
        }
        .onAppear {
            vm.fetchMeasurements(mpId: mp.pointId)
            if vm.unitString.isEmpty {
                vm.measurementUnitString(
                    measurementSystem: container.userPreferences.measurementSystem,
                    measurementUnit: mp.measurementUnit
                )
            }
        }
        .refreshable {
            vm.fetchMeasurements(mpId: mp.pointId)
        }
    }
}

#Preview {
    let container = DependencyContainer()
    let mp = MeasurementPoint(name: "Belly", measurementUnit: .length)
    
    
    MeasurementPointView(vm: container.makeMeasurementPointViewModel(), mp: mp)
        .environmentObject(container)
}

struct MeasurementRow: View {
    let measurement: Measurement
    let measurementUnitString: String
    
    // TODO: add calculator for pounds
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                if measurementUnitString != "ft" {
                    Text("\(measurement.value, specifier: "%.1f") \(measurementUnitString)")
                        .font(.headline)
                } else {
                    let inchTotal = UnitConverter.centimetersToInches(measurement.value)
                    let (feet, inch, decimal) = UnitConverter.inchesToFeetAndInchesAndDecimal(inchTotal)
                    
                    Text("\(feet) ft \(inch),\(decimal) inch")
                        .font(.headline)
                }
                
                Text(measurement.date, style: .date)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                if let note = measurement.notes {
                    if !note.isEmpty{
                        Text(note)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                    }
                }
            }
            
            Spacer()
            
            Text(measurement.date, style: .time)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}
