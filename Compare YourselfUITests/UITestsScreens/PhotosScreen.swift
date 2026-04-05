//
//  PhotosScreen.swift
//  Compare YourselfUITests
//
//  Created by Hubert Wojtowicz on 29/03/2026.
//

import Foundation
import XCUIAutomation

struct PhotosScreen {
    let app: XCUIApplication
    var appScreen: AppScreen { AppScreen(app: app) }
    
    // Elements specific to Settings...
//    var unitPicker: XCUIElement { app.segmentedControls["unitSystemPicker"] }
    
    // Actions specific to Settings...
    func selectMetric() -> Self {
//        unitPicker.buttons["Metric"].tap()
        return self
    }
}
