//
//  AddMeasurementPointView.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 11/01/2026.
//

import SwiftUI
import SwiftData

struct AddMeasurementPointView: View {
    @State var vm: AddMeasurementPointViewModel
    @Environment(\.dismiss) var dismiss
    
    init(vm: AddMeasurementPointViewModel){
        self.vm = vm
    }
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Measurement point name", text: $vm.name)
                    .padding(.bottom, 16)
                
                Picker("Measurement unit", selection: $vm.measurementUnit) {
                    ForEach(MeasurementUnit.allCases) {
                        Text($0.description).tag($0)
                    }
                }
                .pickerStyle(.segmented)
                
                Spacer()
                
                Button("Save") {
                    Task {
                        await vm.saveMeasurementPoint()
                    }
                    dismiss()
                }
                .disabled(!vm.canSave)
            }
            .padding(16)
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
    let measurementPointRepository = MeasurementPointRepository(context: modelContext)
    let viewModel = AddMeasurementPointViewModel(repository: measurementPointRepository)
    
    AddMeasurementPointView(vm: viewModel)
}
