//
//  SettingsView.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 28/03/2026.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var container: DependencyContainer
    
    var body: some View {
        List {
            Section(L10n.Settings.Section.preferences.uppercased()) {
                SettingsRow(icon: "ruler", iconBackground: Color.Background.backgroundOverlay, label: L10n.Settings.Units.label, trailing: {
                    Picker("", selection: $container.userPreferences.measurementSystem) {
                        Text("Metric").tag(MeasurementSystem.metric)
                        Text("Imperial").tag(MeasurementSystem.imperial)
                    }
                    .pickerStyle(.segmented)
                    .tint(Color.Brand.colorProgress)
                })
            }
            Button(action: {
                if container.userPreferences.measurementSystem == .metric {
                    container.userPreferences.measurementSystem = .imperial
                } else {
                    container.userPreferences.measurementSystem = .metric
                }
            }) {
                Text(container.userPreferences.measurementSystem == .metric ? "Switch to Imperial" : "Switch to Metric")
            }
        }
    }
}

#Preview {
    SettingsView()
}
