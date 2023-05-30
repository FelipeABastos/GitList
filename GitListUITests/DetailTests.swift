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
        app.launchArguments = ["-isTesting", "-isTestingUI"]
        app.launch()
    }
    
    func showDetail() {
        launchApp()
        let tableView = app.tables.matching(identifier: "Home_TableView").element
        let cell = tableView.cells.matching(identifier: "elbowdonkey").element
        cell.tap()
    }
    
    func testIfAvatarExists() {
        showDetail()
        
        let avatar = app.images.matching(identifier: "Detail_AvatarImage").element
        
        XCTAssertTrue(avatar.isHittable)
    }
    
    func testIfNameExists() {
        showDetail()
        
        let name = app.staticTexts.matching(identifier: "Detail_NameLabel").element
        
        XCTAssertTrue(name.isHittable)
    }
    
    func testIfDivisorExists() {
        showDetail()
        
        let divisor = app.otherElements.matching(identifier: "Detail_SeparatorView").element
        
        XCTAssertTrue(divisor.isHittable)
    }
    
    func testIfRepositoriesTitleExists() {
        showDetail()
        
        let repositories = app.staticTexts.matching(identifier: "Detail_RepositoriesLabel").element
        
        XCTAssertTrue(repositories.isHittable)
    }
    
    func testIfTableViewExists() {
        showDetail()
        
        let tableView = app.tables.matching(identifier: "Detail_TableView").element
        
        XCTAssertTrue(tableView.exists)
    }
    
    func testIfTableViewIsFilled() {
        showDetail()
        
        let tableView = app.tables.matching(identifier: "Detail_TableView").element
        let cell = tableView.cells.matching(identifier: "browser").element
        
        XCTAssertTrue(cell.isHittable)
    }
}
