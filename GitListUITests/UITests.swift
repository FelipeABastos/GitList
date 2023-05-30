//
//  UITests.swift
//  GitListUITests
//
//  Created by Felipe Amorim Bastos on 30/05/23.
//

import XCTest
@testable import GitList

class UITests: XCTestCase {

    let app = XCUIApplication()
    
    func launchApp() {
        app.launchArguments = ["-isTesting",
                               "-isTestingUI"]
        app.launch()
    }
    
    func showDetail() {
        launchApp()
        
        let tableView = app.tables.matching(identifier: "Home_TableView").element
        let cell = tableView.cells.matching(identifier: "elbowdonkey").element
        
        cell.tap()
    }
}
