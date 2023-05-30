//
//  DetailViewController.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 29/05/23.
//

import UIKit

final class DetailViewController: UIViewController,
                                  DetailPresenterDelegate {
    
    var presenter: DetailPresenter!
    
    private lazy var rootView: DetailView = {
        let view = DetailView()
        view.setup()
        return view
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController -
    //-----------------------------------------------------------------------
    
    override func loadView() {
        view = rootView
        rootView.update(user: presenter.user)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = presenter.user?.login
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.getRepos()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Presenter Delegate -
    //-----------------------------------------------------------------------

    func loadedData() {
        rootView.update(user: presenter.user, repositories: presenter.repositories)
    }

    func loading(_ loading: Bool) {
        if loading {
            Loader.showHUD()
        }else{
            Loader.hideHUD()
        }
    }
}
