//
//  ViewController.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 25/05/23.
//

import UIKit

final class HomeViewController: UIViewController,
                                HomePresenterDelegate,
                                HomeViewDelegate,
                                UISearchResultsUpdating,
                                UISearchBarDelegate {
    
    var presenter: HomePresenter!
    private lazy var rootView: HomeView = {
        let view = HomeView()
        view.setup()
        view.delegate = self
        return view
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController -
    //-----------------------------------------------------------------------
    
    override func loadView() {
        view = rootView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.fix(largeTitle: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Constants.Title.Home
        
        createSearchBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.loadData()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - UISearchController Delegate -
    //-----------------------------------------------------------------------
    
    func updateSearchResults(for searchController: UISearchController) {}
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            presenter.getSpecificUser(userName: searchText)
        }
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - HomeView Delegate -
    //-----------------------------------------------------------------------
    
    func goToDetail(user: User) {
        if let userName = user.login {
            presenter.getSpecificUser(userName: userName)
        }
    }
    
    func refreshData() {
        presenter.loadData(refresh: true)
    }
    
    func loadMoreData(since: Int) {
        presenter.loadMore(since: since)
    }
    
    func dismissSearchBar() {
        self.navigationItem.searchController?.isActive = false
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Presenter Delegate -
    //-----------------------------------------------------------------------
    
    func loading(_ loading: Bool) {
        if loading {
            Loader.showHUD()
        }else{
            Loader.hideHUD()
        }
    }
    
    func loadedData() {
        rootView.update(data: presenter.users)
    }
    
    func createSearchBar() {
        navigationItem.hidesSearchBarWhenScrolling = false
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.searchTextField.textColor = UIColor.white
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Constants.Home.SearchBarPlaceholder
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        searchController.searchBar.keyboardAppearance = .dark
        definesPresentationContext = true
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationItem.searchController = searchController
    }
}
