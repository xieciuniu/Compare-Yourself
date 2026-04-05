//
//  AppScreen.swift
//  Compare YourselfUITests
//
//  Created by Hubert Wojtowicz on 29/03/2026.
//

import Foundation
import XCUIAutomation
import Compare_Yourself
import XCTest

struct AppScreen {
    let app: XCUIApplication
    
    var tabBar: XCUIElement { app.tabBars.firstMatch }
    
    var dashboardTab: XCUIElement { tabBar.buttons["dashboardTab"] }
    var measurementsTab: XCUIElement { tabBar.buttons["measurementsTab"] }
    var photosTab: XCUIElement { tabBar.buttons["photosTab"] }
    var settingsTab: XCUIElement { tabBar.buttons["settingsTab"] }
    
    @discardableResult
    func goToDashboard() -> DashboardScreen {
        XCTAssert(dashboardTab.waitForExistence(timeout: 5))
        dashboardTab.tap()
        return DashboardScreen(app: app)
    }
    
    @discardableResult
    func goToMeasurements() -> MeasurementsScreen {
        XCTAssert(measurementsTab.waitForExistence(timeout: 5))
        measurementsTab.tap()
        return MeasurementsScreen(app: app)
    }
    
    @discardableResult
    func goToPhotos() -> PhotosScreen {
        XCTAssert(photosTab.waitForExistence(timeout: 5))
        photosTab.tap()
        return PhotosScreen(app: app)
    }
    
    @discardableResult
    func goToSettings() -> SettingsScreen {
//        XCTAssert(settingsTab.waitForExistence(timeout: 5))
        settingsTab.tap()
        return SettingsScreen(app: app)
    }
}
