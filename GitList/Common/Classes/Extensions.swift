//
//  Extensions.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import UIKit

//-----------------------------------------------------------------------
//  MARK: - UIApplication -
//-----------------------------------------------------------------------

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        return controller
    }
}

//-----------------------------------------------------------------------
//  MARK: - UINavigationBar -
//-----------------------------------------------------------------------

extension UINavigationBar {
    
    func fix(largeTitle: Bool = false) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor.black
        
        self.tintColor = UIColor.white
        self.standardAppearance = navBarAppearance
        self.scrollEdgeAppearance = navBarAppearance
        self.compactAppearance = navBarAppearance
        self.prefersLargeTitles = largeTitle
    }
}

//-----------------------------------------------------------------------
//  MARK: - Dictionary -
//-----------------------------------------------------------------------

extension Dictionary {
    func buildQueryString() -> String {
        var urlVars:[String] = []
        for (key, value) in self {
            urlVars.append((key as! String) + "=\(value)")
        }
        return urlVars.isEmpty ? "" : "?" + urlVars.joined(separator: "&")
    }
}
