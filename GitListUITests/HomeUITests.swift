//
//  HomeUITests.swift
//  GitListUITests
//
//  Created by Felipe Amorim Bastos on 25/05/23.
//

import XCTest
@testable import GitList

final class HomeUITests: UITests {
    
    func testIfTableViewExists() {
        launchApp()
        
        let tableView = app.tables.matching(identifier: "Home_TableView").element
        
        XCTAssertTrue(tableView.exists)
    }
    
    func testIfTableViewIsFilled() {
        launchApp()
        
        let tableView = app.tables.matching(identifier: "Home_TableView").element
        let cell = tableView.cells.matching(identifier: "elbowdonkey").element
        
        XCTAssertTrue(cell.isHittable)
    }
    
    func testIfSearchIsWorking() {
        launchApp()
        
        let navigationBar = app.navigationBars["Usuários"]
        let searchField = navigationBar.searchFields["Digite o nome do usuário"]
        
        searchField.tap()
        searchField.typeText("elbowdonkey")
    
        let searchButton = app.buttons["Search"]
        searchButton.tap()
    }
    
    func testPullToRefresh() {
        launchApp()
        
        let tableView = app.tables.matching(identifier: "Home_TableView").element
        let cell = tableView.cells.matching(identifier: "elbowdonkey").element
        
        let start = cell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = cell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 60))
        
        start.press(forDuration: 0, thenDragTo: finish)
    }
    
    func testIfTableViewIsScrollable() {
        launchApp()
        
        let tableView = app.tables.matching(identifier: "Home_TableView").element
        tableView.swipeUp()
        
        let cell = tableView.cells.element(boundBy: 15)
        XCTAssertTrue(cell.isHittable)
    }
    
    func testIfNavigationAndSearchBarExists() {
        launchApp()
        
        let navigationBar = app.navigationBars["Usuários"]
        XCTAssertTrue(navigationBar.isHittable)
        
        let searchBar = navigationBar.searchFields["Digite o nome do usuário"]
        XCTAssertTrue(searchBar.isHittable)
    }
}
