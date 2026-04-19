//
//  Compare_YourselfApp.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 10/11/2025.
//

import SwiftUI
import SwiftData

@main
struct Compare_YourselfApp: App {
    let sharedModelContainer: ModelContainer
    @StateObject private var container: DependencyContainer
    
    init() {
        let schema = Schema([MeasurementPoint.self, Measurement.self])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        let mc = try! ModelContainer(for: schema, configurations: [config])
        self.sharedModelContainer = mc
        self._container = StateObject(
            wrappedValue: DependencyContainer(modelContext: ModelContext(mc))
        )
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(container)
        }
        .modelContainer(sharedModelContainer)
    }
}
