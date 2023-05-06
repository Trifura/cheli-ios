//
//  EndpointURLs.swift
//  Treblle v2
//


import Foundation

enum Endpoints {
    
    case login
    case register
    case feed
    case me
    
    var url : URL {
        
        var baseUrl = "https://cheli-api.onrender.com/v1/"
        
        switch self {
        case .login:
            baseUrl.append("auth/login")
        case .register:
            baseUrl.append("auth/register")
        case .feed:
            baseUrl.append("user/feed")
        case .me:
            baseUrl.append("auth/me")
        }
        return URL(string: baseUrl) ?? URL(string: "")!
    }
}
