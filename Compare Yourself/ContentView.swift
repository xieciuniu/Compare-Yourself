//
//  ContentView.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 10/11/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var addWeightViewModel: AddWeightViewModel?
    
    var body: some View {
        Group {
            if let vm = addWeightViewModel {
                AddWeightView(vm: vm)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            if addWeightViewModel == nil {
                let repository = MeasurementRepository(context: modelContext)
                addWeightViewModel = AddWeightViewModel(repository: repository)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [
            MeasurementPoint.self,
            Measurement.self
        ], inMemory: true)
}
