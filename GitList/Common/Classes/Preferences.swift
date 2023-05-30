//
//  Preferences.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 29/05/23.
//

import UIKit

final class Preferences: NSObject {
    
    //------------------------------------------------------------
    //  UI and Unit Tests flags
    //------------------------------------------------------------
    
    //  Is running tests
    
    static var preferenceIsRunningTests = false
    
    public static var isRunningTests: Bool {
        get {
            return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil ||
            ProcessInfo.processInfo.arguments.contains("-isTesting")
        }
    }
    
    //  Is running fail tests
    
    public static var isRunningTestsFail: Bool {
        get { return UserDefaults.standard.bool(forKey: "RunningTests_Fail") }
        set (newValue) { UserDefaults.standard.set(newValue, forKey: "RunningTests_Fail") }
    }
}
