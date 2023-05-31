//
//  Constants.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import Foundation

final class Constants {
    
    struct Title {
        static let Home = "Usuários"
    }
    
    struct Home {
        static let SearchBarPlaceholder = "Digite o nome do usuário"
    }
    
    struct Detail {
        static let Repositories = "Repositórios"
    }
    
    struct API {
        static let BaseURL = "https://api.github.com/"
        
        struct Endpoint {
            static let Users = "users"
        }
    }
    
    struct AccessibilityIdentifier {
        
        struct UserCell {
            static let TitleLabel = "UserCell_Title"
            static let IconImage = "UserCell_IconImage"
            static let BackgroundView = "UserCell_BackgroundView"
            static let SeparatorView = "UserCell_SeparatorView"
        }
        
        struct RepositoryCell {
            static let TitleLabel = "RepositoryCell_Title"
            static let BackgroundView = "RepositoryCell_BackgroundView"
            static let BadgeView = "RepositoryCell_BadgeView"
            static let IconImage = "RepositoryCell_IconImage"
            static let StarImage = "RepositoryCell_StarImage"
            static let StarLabel = "RepositoryCell_StarLabel"
        }
        
        struct EmptyTableView {
            static let Image = "EmptyTableView_Image"
            static let Title = "EmptyTableView_Title"
        }
        
        struct Detail {
            static let AvatarImage = "Detail_AvatarImage"
            static let NameLabel = "Detail_NameLabel"
            static let SeparatorView = "Detail_SeparatorView"
            static let RepositoriesLabel = "Detail_RepositoriesLabel"
            static let TableView = "Detail_TableView"
        }
        
        struct Home {
            static let RefreshControl = "Home_RefreshControl"
            static let TableView = "Home_TableView"
        }
    }
    
    struct Messages {
        static let UnknownError = "Ops! Algo aconteceu, tente novamente mais tarde."
        static let EmptyList = "Lista vazia!"
    }
}
