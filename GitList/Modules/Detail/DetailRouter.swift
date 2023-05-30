//
//  DetailRouter.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 29/05/23.
//

import UIKit

final class DetailRouter: Router {
    
    init(user: User) {
        super.init()
        
        let controller = DetailViewController()
        let presenter = DetailPresenter(delegate: controller)
        
        controller.presenter = presenter
        controller.presenter.user = user
        
        super.viewController = controller
    }
}
