//
//  HomeRouter.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import UIKit

final class HomeRouter: Router {
    
    override init() {
        super.init()
        
        let controller = HomeViewController()
        let presenter = HomePresenter(delegate: controller)
        
        controller.presenter = presenter
        
        super.viewController = controller
    }
}
