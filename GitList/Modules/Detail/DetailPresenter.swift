//
//  DetailPresenter.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 29/05/23.
//

import UIKit

//-----------------------------------------------------------------------
//  MARK: - Presenter Delegate
//-----------------------------------------------------------------------

protocol DetailPresenterDelegate {
    func loadedData()
    func loading(_ loading: Bool)
}

//-----------------------------------------------------------------------
//  MARK: - Presenter
//-----------------------------------------------------------------------

final class DetailPresenter {

    var delegate: DetailPresenterDelegate?
    var user: User!
    var repositories: [Repository] = []
    
    init (delegate: DetailPresenterDelegate?) {
        self.delegate = delegate
    }
    
    func getRepos() {
        
        guard let login = user.login else { return }
        
        delegate?.loading(true)
        Repository.loadAll(login: login) { result, error in
            self.delegate?.loading(false)
            if let items = result {
                self.repositories = items
                self.delegate?.loadedData()
            }else{
                NotificationTopBanner.showMessage(message: error?.message ?? Constants.Messages.UnknownError, type: .warning)
            }
        }
    }
}