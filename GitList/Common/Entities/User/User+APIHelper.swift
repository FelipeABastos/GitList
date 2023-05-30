//
//  User+APIHelper.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import Foundation

extension User {
    
    static func loadAll(since: Int,
                        _ completion: @escaping (_ result: [User]?,
                                                 _ error: APIResponseError?) -> Void) {
        
        let parameters = ["per_page": 40,
                          "since": since]
        
        APIHelper.request(endpoint: Constants.API.Endpoint.Users,
                          parameters: parameters,
                          responseType: [User].self,
                          mockType: .users) { response, error  in
            
            if error == nil {
                completion(response, nil)
            }else{
                completion(nil, error)
            }
        }
    }
    
    static func loadUser(userName: String,
                         _ completion: @escaping (_ result: User?,
                                                  _ error: APIResponseError?) -> Void) {
        
        APIHelper.request(endpoint: Constants.API.Endpoint.Users + "/\(userName)",
                          parameters: [:],
                          responseType: User.self,
                          mockType: .user) { response, error in
            
            if error == nil {
                completion(response, nil)
            }else{
                completion(nil, error)
            }
        }
    }
}
