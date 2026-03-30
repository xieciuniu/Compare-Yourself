//
//  NavigationTest.swift
//  Compare YourselfUITests
//
//  Created by Hubert Wojtowicz on 29/03/2026.
//

import XCTest

final class NavigationTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSwitchBetweenTabs() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let appScreen = AppScreen(app: app)
        
        appScreen
            .goToSettings()
            .appScreen
            .goToMeasurements()
            .appScreen
            .goToPhotos()
            .appScreen
            .goToDashboard()
        
    }
}
