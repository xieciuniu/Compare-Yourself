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
                ForEach(vm.measurements.sorted(by: { $0.date > $1.date })) { measurement in
                    MeasurementRow(measurement: measurement)
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
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("\(measurement.value, specifier: "%.1f") cm")
                    .font(.headline)
                
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
