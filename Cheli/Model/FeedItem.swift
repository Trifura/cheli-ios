//
//  FeedItem.swift
//  Cheli
//


import Foundation
import SwiftUI

struct FeedItem: Codable, Hashable {
    var user: User
    var challenge: Challenge
   
    
    init(data: [String: Any]) {
        user = User(data: data["user"] as? [String: Any] ?? [:])
        challenge = Challenge(data: data["challenge"] as? [String: Any] ?? [:])
    }
}

struct User: Codable, Hashable {
    var id: Int
    var username: String
    var fullName: String
    var email: String
    
    init(data: [String: Any]) {
        id = data["id"] as? Int ?? 0
        username = data["username"] as? String ?? ""
        fullName = data["fullName"] as? String ?? ""
        email = data["email"] as? String ?? ""
    }
}

struct Challenge: Codable, Hashable {
    var id: Int
    var uuid: String
    var title: String
    var description: String
    var createdAt: String
    
    init(data: [String: Any]) {
        id = data["id"] as? Int ?? 0
        uuid = data["uuid"] as? String ?? ""
        title = data["title"] as? String ?? ""
        description = data["description"] as? String ?? ""
        createdAt = data["createdAt"] as? String ?? ""
    }
}
