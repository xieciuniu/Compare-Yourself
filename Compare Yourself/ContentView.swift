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
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "house")
                        .accessibilityIdentifier("dashboardTab")
                }
            MeasurementPointListView(vm: container.makeMeasurementPointListViewModel())
                .tabItem {
                    Label("Measurements", systemImage: "ruler")
                        .accessibilityIdentifier("measurementsTab")
                }
            PhotosView()
                .tabItem {
                    Label("Photos", systemImage: "camera.viewfinder")
                        .accessibilityIdentifier("photosTab")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                        .accessibilityIdentifier("settingsTab")
                }
        }
        .tint(Color.Brand.colorEnergy)
        .background(Color.Background.backgroundElevated)
    }
}

#Preview {
    let container = DependencyContainer.preview()
    ContentView()
        .modelContainer(for: [
            MeasurementPoint.self,
            Measurement.self
        ], inMemory: true)
        .environmentObject(container)
}
