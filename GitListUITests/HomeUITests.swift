//
//  GitListUITests.swift
//  GitListUITests
//
//  Created by Felipe Amorim Bastos on 25/05/23.
//

import XCTest
@testable import GitList

final class HomeUITests: XCTestCase {
    
    private let app = XCUIApplication()
    
    func launchApp() {
        app.launchArguments = ["-isTesting"]
        app.launch()
    }
    
    func testFilledList() {
        launchApp()
        XCTAssertTrue(app.tables.staticTexts["elbowdonkey"].exists)
    }
    
    func testCellClicked() {
        launchApp()
        XCTAssertTrue(app.tables.staticTexts["elbowdonkey"].isHittable)
    }
    
    func testIsScrollable() {
        launchApp()
        app.swipeUp()
        XCTAssertTrue(app.tables.cells.containing(.staticText, identifier:"engineyard").element.exists)
    }
    
    func testIfSearchBarExists() {
        launchApp()
        XCTAssertTrue(XCUIApplication().navigationBars["Usuários"].searchFields["Digite o nome do usuário"].exists)
    }
}
