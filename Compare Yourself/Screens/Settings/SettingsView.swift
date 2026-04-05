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
                            .accessibilityIdentifier("Picker-Metric")
                        Text("Imperial").tag(MeasurementSystem.imperial)
                            .accessibilityIdentifier("Picker-Imperial")
                    }
                    .pickerStyle(.segmented)
                    .tint(Color.Brand.colorProgress)
                })
            }
        }
    }
}

#Preview {
    SettingsView()
}
