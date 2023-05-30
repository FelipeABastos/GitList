//
//  Router.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import UIKit

class Router {
    
    var viewController: UIViewController!
    
    //-----------------------------------------------------------------------
    //  MARK: - Mount root view -
    //-----------------------------------------------------------------------
    
    func getRootView() -> UINavigationController {
        return UINavigationController(rootViewController: HomeRouter().viewController)
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Present views -
    //-----------------------------------------------------------------------
    
    func show() {
        UIApplication.topViewController()?.navigationController?.pushViewController(viewController, animated: true)
    }
}

//-----------------------------------------------------------------------
//  MARK: - Show modules (calling routers) -
//-----------------------------------------------------------------------

extension Router {
    static func showDetail(user: User) {
        DetailRouter(user: user).show()
    }
}
