//
//  AppScreen.swift
//  Compare YourselfUITests
//
//  Created by Hubert Wojtowicz on 29/03/2026.
//

import Foundation
import XCUIAutomation
import Compare_Yourself

struct AppScreen {
    let app: XCUIApplication
    
    var tabBar: XCUIElement { app.tabBars.firstMatch }
    
    var dashboardTab: XCUIElement { tabBar.buttons["dashboardTab"] }
    var measurementsTab: XCUIElement { tabBar.buttons["measurementsTab"] }
    var photosTab: XCUIElement { tabBar.buttons["photosTab"] }
    var settingsTab: XCUIElement { tabBar.buttons["settingsTab"] }
    
    @discardableResult
    func goToDashboard() -> DashboardScreen {
        dashboardTab.tap()
        return DashboardScreen(app: app)
    }
    
    @discardableResult
    func goToMeasurements() -> MeasurementsScreen {
        measurementsTab.tap()
        return MeasurementsScreen(app: app)
    }
    
    @discardableResult
    func goToPhotos() -> PhotosScreen {
        photosTab.tap()
        return PhotosScreen(app: app)
    }
    
    @discardableResult
    func goToSettings() -> SettingsScreen {
        settingsTab.tap()
        return SettingsScreen(app: app)
    }
}
