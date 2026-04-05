//
//  SettingsScreen.swift
//  Compare YourselfUITests
//
//  Created by Hubert Wojtowicz on 29/03/2026.
//

import Foundation
import XCUIAutomation

struct SettingsScreen {
    let app: XCUIApplication
    var appScreen: AppScreen { AppScreen(app: app) }
    
    // Elements specific to Settings...
    var unitPicker: XCUIElement { app.segmentedControls["unitSystemPicker"] }
    var metricButton: XCUIElement { app.buttons["Picker-Metric"] }
    var imperialButton: XCUIElement { app.buttons["Picker-Imperial"] }
    
    // Actions specific to Settings...
    func selectMetric() -> Self {
        metricButton.tap()
        return self
    }
    
    func selectImperial() -> Self {
        imperialButton.tap()
        return self
    }
}
