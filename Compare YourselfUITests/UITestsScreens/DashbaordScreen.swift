//
//  DashbaordScreen.swift
//  Compare YourselfUITests
//
//  Created by Hubert Wojtowicz on 29/03/2026.
//

import Foundation
import XCUIAutomation

struct DashboardScreen {
    let app: XCUIApplication
    var appScreen: AppScreen { AppScreen(app: app) }
    
    // Elements specific to Settings...
    
    // Actions specific to Settings...
    func selectMetric() -> Self {
        return self
    }
}
