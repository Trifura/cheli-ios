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
    var uuid: String
    var username: String
    var fullName: String
    var email: String
    var initials: String
    var followingCount: Int
    var followedByCount: Int
    var challengesCount: Int
    var challenges: [UserChallenge]
    
    
    init(data: [String: Any]) {
        uuid = data["id"] as? String ?? "some-random-id"
        username = data["username"] as? String ?? ""
        fullName = data["fullName"] as? String ?? ""
        email = data["email"] as? String ?? ""
        initials = data["initials"] as? String ?? ""
        followingCount = data["followingCount"] as? Int ?? 0
        followedByCount = data["followedByCount"] as? Int ?? 0
        challengesCount = data["challengesCount"] as? Int ?? 0
        challenges = (data["challenges"] as? [[String: Any]] ?? []).map({ UserChallenge(data: $0) })
    }
}

struct Challenge: Codable, Hashable {
    var uuid: String
    var title: String
    var description: String
    var createdAt: DateFormat?
    
    init(data: [String: Any]) {
        uuid = data["uuid"] as? String ?? ""
        title = data["title"] as? String ?? ""
        description = data["description"] as? String ?? ""
        createdAt = DateFormat(data: data["created_at"] as? [String: Any] ?? [:])
    }
}

struct UserChallenge: Codable, Hashable {
    var uuid: String
    var finished: Bool
    var createdAt: DateFormat?
    var updatedAt: DateFormat?
    var challenge: Challenge?
    
    init(data: [String: Any]) {
        uuid = data["uuid"] as? String ?? ""
        finished = data["finished"] as? Bool ?? false
        createdAt = data["created_at"] as? DateFormat
        updatedAt = data["updated_at"] as? DateFormat
        challenge = Challenge(data: data["challenge"] as? [String : Any] ?? [:])
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

