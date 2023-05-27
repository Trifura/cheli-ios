//
//  FeedItem.swift
//  Cheli
//


import Foundation
import SwiftUI

//struct FeedItem: Codable, Hashable {
//    var user: User
//    var cheli: Challenge
//    var updatedAt: DateFormat
//    var uuid: String
//    var finished: Bool
//    var timeLeft: String
//
//
//    init(data: [String: Any]) {
//        user = User(data: data["user"] as? [String: Any] ?? [:])
//        cheli = Challenge(data: data["cheli"] as? [String: Any] ?? [:])
//        updatedAt = DateFormat(data: data["updatedAt"] as? [String: Any] ?? [:])
//        uuid = data["uuid"] as? String ?? ""
//        finished = data["finished"] as? Bool ?? false
//        timeLeft = data["timeLeft"] as? String ?? ""
//    }
//}

struct User: Codable, Hashable {
    var id: String
    var username: String
    var fullName: String
    var email: String
    var initials: String
    var followingCount: Int
    var followersCount: Int
    var cheliPostsCount: Int
    var cheliPosts: [CheliPost]
    var activeCheli: CheliPost
    
    
    init(data: [String: Any]) {
        id = data["id"] as? String ?? "some-random-id"
        username = data["username"] as? String ?? ""
        fullName = data["fullName"] as? String ?? ""
        email = data["email"] as? String ?? ""
        initials = data["initials"] as? String ?? ""
        followingCount = data["followingCount"] as? Int ?? 0
        followersCount = data["followersCount"] as? Int ?? 0
        cheliPostsCount = data["cheliPostsCount"] as? Int ?? 0
        cheliPosts = (data["cheliPosts"] as? [[String: Any]] ?? []).map({ CheliPost(data: $0) })
        activeCheli = CheliPost(data: data["activeCheli"] as? [String : Any] ?? [:])
    }
}

struct Cheli: Codable, Hashable {
    var uuid: String
    var title: String
    var description: String
    var createdAt: DateFormat
    var updatedAt: DateFormat
    var icon: String
    var color: String
    
    init(data: [String: Any]) {
        uuid = data["uuid"] as? String ?? ""
        title = data["title"] as? String ?? ""
        description = data["description"] as? String ?? ""
        createdAt = DateFormat(data: data["created_at"] as? [String: Any] ?? [:])
        updatedAt = DateFormat(data: data["created_at"] as? [String: Any] ?? [:])
        icon = data["icon"] as? String ?? ""
        color = data["color"] as? String ?? ""
    }
}

struct CheliPost: Codable, Hashable {
    var id: String
    var isCompleted: Bool
    var createdAt: DateFormat
    var updatedAt: DateFormat
    var cheli: Cheli
    var timeLeft: String
    
    init(data: [String: Any]) {
        id = data["id"] as? String ?? ""
        isCompleted = data["isCompleted"] as? Bool ?? false
        createdAt = DateFormat(data: data["createdAt"] as? [String: Any] ?? [:])
        updatedAt = DateFormat(data: data["updatedAt"] as? [String: Any] ?? [:])
        cheli = Cheli(data: data["cheli"] as? [String : Any] ?? [:])
        timeLeft = data["timeLeft"] as? String ?? ""
    }
}

struct DateFormat: Codable, Hashable {
    var timestamp: Int
    var human: String
    
    init(data: [String: Any]) {
        timestamp = data["timestamp"] as? Int ?? 0
        human = data["human"] as? String ?? ""
    }
}

