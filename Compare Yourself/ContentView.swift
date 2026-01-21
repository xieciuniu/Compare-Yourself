//
//  ContentView.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 10/11/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var container: DependencyContainer
    
    var body: some View {
        Group {
            MeasurementPointListView(vm: container.makeMeasurementPointListViewModel())
        }
    }
}

#Preview {
    let container = DependencyContainer()
    ContentView()
        .modelContainer(for: [
            MeasurementPoint.self,
            Measurement.self
        ], inMemory: true)
        .environmentObject(container)
}
