//
//  Repository+APIHelper.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 29/05/23.
//

import Foundation

extension Repository {
    
    static func loadAll(login: String,
                        _ completion: @escaping (_ result: [Repository]?,
                                                 _ error: APIResponseError?) -> Void) {
        
        APIHelper.request(endpoint: Constants.API.Endpoint.Users + "/\(login)/repos",
                          parameters: [:],
                          responseType: [Repository].self,
                          mockType: .repos) { response, error in
            
            if error == nil {
                completion(response, nil)
            }else{
                completion(nil, error)
            }
        }
    }
}
