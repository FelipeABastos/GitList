//
//  Enums.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import Foundation

//------------------------------------------------------------
//    Struct: APIHelper
//------------------------------------------------------------

enum ResponseError: Error {
    case none
    case unknown
    case invalidCredentials
}

//-----------------------------------------------------------------------
//  Struct: Mock
//-----------------------------------------------------------------------

enum MockType: String {
    case error
    case users
    case user
    case repos
}
