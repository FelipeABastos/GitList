//
//  APIHelper.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import Foundation

final class APIHelper {
    
    static func request<T:Decodable>(endpoint: String,
                                     parameters: Dictionary<String, Any>,
                                     responseType: T.Type,
                                     mockType: MockType,
                                     completion: @escaping (_ response: T?,
                                                            _ error: APIResponseError?) -> Void) {
        
        var serverURL: String = Constants.API.BaseURL + endpoint
        serverURL += parameters.buildQueryString()
        
        let request = NSMutableURLRequest()
        request.timeoutInterval = 30
        request.cachePolicy = .useProtocolCachePolicy
        request.setValue("*/*", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        request.url = URL(string: serverURL)
        
        //---------------------------------------------------------
        //  Running tests
        //---------------------------------------------------------
        
        if Preferences.preferenceIsRunningTests {
            if Preferences.isRunningTestsFail {
                completion(nil, APIResponseError(documentationUrl: "DocumentationTest", message: "ErrorTest"))
            }else{
                if let mock = Mock.shared.load(type: mockType) {
                    let parse = try? JSONDecoder().decode(T.self, from: mock)
                    completion(parse, nil)
                }
            }
            return
        }
        
        //---------------------------------------------------------
        //  Load API
        //---------------------------------------------------------
        
        DispatchQueue.global().async {
            let _ = URLSession.shared.dataTask(with: request as URLRequest,
                                               completionHandler: { data, response, error -> Void in
                
                DispatchQueue.main.async {
                    if let data = data, data.count != 0 {
                        let responseError = try? JSONDecoder().decode(APIResponseError.self, from: data)
                        do {
                            let parse = try JSONDecoder().decode(T.self, from: data)
                            completion(parse, responseError)
                        }catch{
                            print(error)
                            completion(nil, responseError)
                        }
                    }else{
                        completion(nil, nil)
                    }
                }
            }).resume()
        }
    }
}
