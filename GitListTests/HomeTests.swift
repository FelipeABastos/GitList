//
//  GitListTests.swift
//  GitListTests
//
//  Created by Felipe Amorim Bastos on 25/05/23.
//

import XCTest
@testable import GitList

final class HomeTests: XCTestCase {
    
    private let presenter = HomePresenter(delegate: nil)
    
    func testGetUsersSuccess() {
        Preferences.isRunningTestsFail = false
        presenter.getUsers()
        XCTAssertGreaterThan(presenter.users.count, 0)
    }
    
    func testGetMoreUsersSuccess() {
        Preferences.isRunningTestsFail = false
        presenter.getUsers(refresh: true, since: 1)
        XCTAssertGreaterThan(presenter.users.count, 0)
    }
    
    func testGetSpecificUserSuccess() {
        Preferences.isRunningTestsFail = false
        presenter.getSpecificUser(userName: "")
    }
    
    func testGetSpecificUserError() {
        Preferences.isRunningTestsFail = true
        presenter.getSpecificUser(userName: "")
    }
    
    func testRefreshSuccess() {
        Preferences.isRunningTestsFail = false
        presenter.getUsers() // to fill users array
        presenter.getUsers(refresh: true)
        XCTAssertGreaterThan(presenter.users.count, 0)
    }
    
    func testGetUsersFail() {
        Preferences.isRunningTestsFail = true
        presenter.getUsers()
        XCTAssertEqual(presenter.users.count, 0)
    }
}
