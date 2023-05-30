//
//  HomePresenter.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

//-----------------------------------------------------------------------
//  MARK: - Presenter Delegate
//-----------------------------------------------------------------------

protocol HomePresenterDelegate {
    func loadedData()
    func loading(_ loading: Bool)
    func dismissSearchBar()
}

//-----------------------------------------------------------------------
//  MARK: - Presenter -
//-----------------------------------------------------------------------

final class HomePresenter {
    
    var delegate: HomePresenterDelegate?
    
    private(set) var users: [User] = []
    
    init (delegate: HomePresenterDelegate?) {
        self.delegate = delegate
    }
    
    func loadData(refresh: Bool = false) {
        if users.isEmpty || refresh {
            getUsers { items in
                self.users = items
                self.delegate?.loadedData()
            }
        }
    }
    
    func loadMore(since: Int = 0) {
        if !Preferences.isRunningUITests {
            getUsers(since: since) { items in
                self.users.append(contentsOf: items)
                self.delegate?.loadedData()
            }
        }
    }
    
    private func getUsers(since: Int = 0,
                          completion: @escaping (_ items: [User]) -> Void) {
        self.delegate?.loading(true)
        User.loadAll(since: since) { result, error in
            self.delegate?.loading(false)
            if let items = result {
                completion(items)
            }else{
                if let errorMessage = error?.message {
                    NotificationTopBanner.showMessage(message: errorMessage,
                                                      type: .warning)
                }
                completion([])
            }
        }
    }
    
    func loadUser(userName: String) {
        self.delegate?.loading(true)
        User.loadUser(userName: userName) { result, error in
            self.delegate?.loading(false)
            if let user = result {
                Router.showDetail(user: user)
            }else{
                if let errorMessage = error?.message {
                    NotificationTopBanner.showMessage(message: errorMessage,
                                                      type: .warning)
                }
            }
            self.delegate?.dismissSearchBar()
        }
    }
}
