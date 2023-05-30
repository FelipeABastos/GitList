//
//  APIResponseError.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

import Foundation

struct APIResponseError: Codable {
    
    var documentationUrl: String?
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case documentationUrl = "documentation_url"
        case message = "message"
    }
}
