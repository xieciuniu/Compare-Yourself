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
        VStack {
            Text(measurementPoint.name)
                .font(Font.largeTitle.bold())
                .padding(.top, 20)
            
            HStack(spacing: -10) {
                Picker(selection: $vm.hundredsDigit, label: Text("")) {
                    ForEach(0 ..< 10) { index in
                        Text("\(index)")
                            .font(.title)
                    }
                }
                .pickerStyle(.wheel)
                
                Text("")
                
                Picker(selection: $vm.tensDigit, label: Text("")) {
                    ForEach(0 ..< 10) { index in
                        Text("\(index)")
                            .font(.title)
                    }
                }
                .pickerStyle(.wheel)
                
                Text("")
                
                Picker(selection: $vm.onesDigit, label: Text("")) {
                    ForEach(0 ..< 10) { index in
                        Text("\(index)")
                            .font(.title)
                    }
                }
                .pickerStyle(.wheel)

                Text(",")
                    .font(.title)

                Picker(selection: $vm.oneOfTensDigit, label: Text("")) {
                    ForEach(0 ..< 10) { index in
                        Text("\(index)")
                            .font(.title)
                    }
                }
                .pickerStyle(.wheel)
                
                Text(" cm")
                    .font(.title)
            }
            .frame(height: 200)
            .padding(.horizontal, 20)
            .padding(.vertical, -5)
            
            Section {
                TextField("Notes", text: $vm.notes)
            }
            .frame(height: 100)
            .padding(.horizontal, 20)
            
            List {
                
            }
            
            Spacer()
            
            Button("Save") {
                vm.addMeasurement(mp: measurementPoint)
                dismiss()
            }
        }
        .onAppear() {
            Task {
                await vm.setLastMeasurementValue(measurementPointId: measurementPoint.pointId)
            }
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
