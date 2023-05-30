//
//  User.swift
//  GitList
//
//  Created by Felipe Amorim Bastos on 28/05/23.
//

struct User: Codable {
    
    var login: String?
    var id: Int?
    var nodeID: String?
    var avatar: String?
    var gravatarID: String?
    var url: String?
    var html: String?
    var followers: String?
    var following: String?
    var gists: String?
    var starred: String?
    var subscriptions: String?
    var organizations: String?
    var repos: String?
    var events: String?
    var received: String?
    var type: String?
    var admin: Bool?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case name
        case nodeID = "node_id"
        case avatar = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case html = "html_url"
        case followers = "followers_url"
        case following = "following_url"
        case gists = "gists_url"
        case starred = "starred_url"
        case subscriptions = "subscriptions_url"
        case organizations = "organizations_url"
        case repos = "repos_url"
        case events = "events_url"
        case received = "received_events_url"
        case type
        case admin = "site_admin"
    }
}
