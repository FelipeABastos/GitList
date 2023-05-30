//
//  AppDelegate.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 25/05/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    //-----------------------------------------------------------------------
    //  MARK: - App Delegate -
    //-----------------------------------------------------------------------
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        Preferences.preferenceIsRunningTests = true
        
        //-----------------------------------
        //  BaseRouter
        //-----------------------------------
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = Router().getRootView()
        window?.makeKeyAndVisible()
        
        return true
    }
}

