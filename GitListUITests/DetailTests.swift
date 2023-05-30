//
//  GitListUITestsLaunchTests.swift
//  GitListUITests
//
//  Created by Felipe Amorim Bastos on 25/05/23.
//

import XCTest
@testable import GitList

final class DetailTests: XCTestCase {
    private let app = XCUIApplication()
    
    func launchApp() {
        app.launchArguments = ["-isTesting"]
        app.launch()
    }
    
    func showDetail() {
        launchApp()
        app.tables.firstMatch.tap()
    }
    
    func testFilledList() {
        showDetail()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertTrue(XCUIApplication().tables["Detail_TableView"].staticTexts["AVKitExample"].exists)
        }
    }
    
    func testIsScrollable() {
        showDetail()
        app.swipeUp()
        XCTAssertTrue(app.tables.cells.containing(.staticText, identifier:"CryptoMarket").element.exists)
    }
}
