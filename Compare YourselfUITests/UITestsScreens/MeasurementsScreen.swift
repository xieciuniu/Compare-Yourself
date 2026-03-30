//
//  MeasurementsScreen.swift
//  Compare YourselfUITests
//
//  Created by Hubert Wojtowicz on 29/03/2026.
//

import Foundation
import XCUIAutomation

struct MeasurementsScreen {
    let app: XCUIApplication
    var appScreen: AppScreen { AppScreen(app: app) }
    
    // Elements specific to Settings...
//    var unitPicker: XCUIElement { app.segmentedControls["unitSystemPicker"] }
    
    // Actions specific to Settings...
    func selectMetric() -> Self {

        return self
    }
}
