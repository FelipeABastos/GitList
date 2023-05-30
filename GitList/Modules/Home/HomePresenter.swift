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
//  MARK: - Presenter
//-----------------------------------------------------------------------
final class HomePresenter {
    
    var delegate: HomePresenterDelegate?
    
    private(set) var users: [User] = []
    
    init (delegate: HomePresenterDelegate?) {
        self.delegate = delegate
    }
    
    func getUsers(refresh: Bool = false, since: Int = 0) {
        
        if users.isEmpty || refresh {
            
            if since == 0 {
                self.delegate?.loading(true)
            }
            
            User.loadAll(since: since) { result, error in
                self.delegate?.loading(false)
                if let items = result {
                    if since != 0 {
                        self.users += items
                    }else{
                        self.users = items
                    }
                    self.delegate?.loadedData()
                }else{
                    if let errorMessage = error?.message {
                        NotificationTopBanner.showMessage(message: errorMessage, type: .warning)
                    }
                }
            }
        }
    }
    
    func getSpecificUser(userName: String) {
        
        self.delegate?.loading(true)
        User.loadSpecificUser(userName: userName) { result, error in
            self.delegate?.loading(false)
            if let user = result {
                Router.showDetail(user: user)
                self.delegate?.dismissSearchBar()
            }else{
                if let errorMessage = error?.message {
                    NotificationTopBanner.showMessage(message: errorMessage, type: .warning)
                }
                self.delegate?.dismissSearchBar()
            }
        }
    }
}
