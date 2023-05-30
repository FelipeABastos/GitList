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
        let view = DetailView(user: presenter.user)
        return view
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController -
    //-----------------------------------------------------------------------
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = presenter.user?.login
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.loadRepositories()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Presenter Delegate -
    //-----------------------------------------------------------------------

    func loadedData() {
        rootView.update(repositories: presenter.repositories)
    }

    func loading(_ loading: Bool) {
        if loading {
            Loader.showHUD()
        }else{
            Loader.hideHUD()
        }
    }
}
