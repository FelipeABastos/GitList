//
//  Repository.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 29/05/23.
//

import Foundation

struct Repository: Codable {
    
    var id: Int?
    var name: String?
    var fullName: String?
    var url: String?
    var language: String?
    var forks: Int?
    var stars: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url = "html_url"
        case fullName = "full_name"
        case language
        case forks
        case stars = "stargazers_count"
    }
}
