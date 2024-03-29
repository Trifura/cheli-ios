

import Foundation

enum Endpoints {
    
    case login
    case register
    case feed
    case me
    case completeCheli
    case getUser
    case notifications
    case searchUsers
    
    var url : URL {
        
        var baseUrl = "https://cheli-api.onrender.com/v2/"
        
        switch self {
        case .login:
            baseUrl.append("auth/login")
        case .register:
            baseUrl.append("auth/register")
        case .feed:
            baseUrl.append("user/home")
        case .me:
            baseUrl.append("auth/me")
        case .completeCheli:
            baseUrl.append("cheli-post/complete")
        case .getUser:
            baseUrl.append("user")
        case .notifications:
            baseUrl.append("user/follow/notifications")
        case .searchUsers:
            baseUrl.append("user/search")
        }
        return URL(string: baseUrl) ?? URL(string: "")!
    }
    
    
    
}
