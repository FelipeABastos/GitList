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
        presenter.loadData()
        XCTAssertGreaterThan(presenter.users.count, 0)
    }
    
    func testGetUsersFail() {
        Preferences.isRunningTestsFail = true
        presenter.loadData()
        XCTAssertEqual(presenter.users.count, 0)
    }
    
    func testGetMoreUsersSuccess() {
        Preferences.isRunningTestsFail = false
        presenter.loadMore(since: 1)
        XCTAssertGreaterThan(presenter.users.count, 0)
    }
    
    func testGetSpecificUserSuccess() {
        Preferences.isRunningTestsFail = false
        presenter.loadUser(userName: "")
    }
    
    func testGetSpecificUserFail() {
        Preferences.isRunningTestsFail = true
        presenter.loadUser(userName: "")
    }
    
    func testRefreshSuccess() {
        Preferences.isRunningTestsFail = false
        presenter.loadData()// to fill users array
        presenter.loadData(refresh: true)
        XCTAssertGreaterThan(presenter.users.count, 0)
    }
}
