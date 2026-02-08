//
//  AddMeasurement.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 06/01/2026.
//

import SwiftUI
import SwiftData

struct AddMeasurement: View {
    @State var vm: AddMeasurementViewModel
    private var measurementPoint: MeasurementPoint
    @Environment(\.dismiss) var dismiss
    
    init(vm: AddMeasurementViewModel, measurementPoint: MeasurementPoint) {
        self.vm = vm
        self.measurementPoint = measurementPoint
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Value picker
                pickerSection
                
                // Notes section
                notesSection
                
                Spacer()
            }
            .navigationTitle("Add Measurement")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        vm.addMeasurement(mp: measurementPoint)
                        dismiss()
                    }
                }
            }
            .task {
                await vm.setLastMeasurementValue(measurementPointId: measurementPoint.pointId)
            }
        }
    }
    
    // MARK: - Sections
    
    private var pickerSection: some View {
        VStack(spacing: 8) {
            Text(measurementPoint.name)
                .font(.headline)
                .foregroundStyle(.secondary)
            
            HStack(spacing: -10) {
                Picker(selection: $vm.hundredsDigit, label: Text("")) {
                    ForEach(0..<10) { index in
                        Text("\(index)").tag(index)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 60)
                
                Picker(selection: $vm.tensDigit, label: Text("")) {
                    ForEach(0..<10) { index in
                        Text("\(index)").tag(index)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 60)
                
                Picker(selection: $vm.onesDigit, label: Text("")) {
                    ForEach(0..<10) { index in
                        Text("\(index)").tag(index)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 60)
                
                Text(",")
                    .font(.title)
                
                Picker(selection: $vm.oneOfTensDigit, label: Text("")) {
                    ForEach(0..<10) { index in
                        Text("\(index)").tag(index)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 60)
                
                Text("cm")
                    .font(.title3)
            }
            .frame(height: 200)
        }
    }
    
    private var notesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Notes (Optional)")
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.horizontal)
            
            TextField("Add any notes...", text: $vm.notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .lineLimit(3...6)
        }
    }
}

#Preview {
    let schema = Schema([
        MeasurementPoint.self,
        Measurement.self,
    ])
    let configuration = ModelConfiguration(
        schema: schema,
        isStoredInMemoryOnly: true
    )
    
    let container = try! ModelContainer(
        for: schema,
        configurations: configuration
    )
    let modelContext = ModelContext(container)
    
    let measurementRepository = MeasurementRepository(context: modelContext)
    let viewModel = AddMeasurementViewModel(repository: measurementRepository)
    let measurementPoint = MeasurementPoint(
        name: "Belly",
        measurementUnit: .length
    )
    
    return AddMeasurement(
        vm: viewModel,
        measurementPoint: measurementPoint
    )
}
