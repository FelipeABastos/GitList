//
//  DetailTests.swift
//  GitListTests
//
//  Created by Felipe Amorim Bastos on 29/05/23.
//

import XCTest
@testable import GitList

class DetailTests: XCTestCase {

    private let presenter = DetailPresenter(delegate: nil)
    
    func testGetReposSuccess() {
        Preferences.isRunningTestsFail = false
        presenter.user = User()
        presenter.user.login = ""
        presenter.getRepos()
        XCTAssertGreaterThan(presenter.repositories.count, 0)
    }
    
    func testGetReposFail() {
        Preferences.isRunningTestsFail = true
        presenter.user = User()
        presenter.user.login = ""
        presenter.getRepos()
        XCTAssertEqual(presenter.repositories.count, 0)
    }
}
