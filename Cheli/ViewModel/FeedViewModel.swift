//
//  FeedViewModel.swift
//  Cheli
//


import Foundation
import SwiftUI
import Alamofire

class FeedViewModel: ObservableObject {
    @Published var myCheli : CheliPost?
    @Published var feedItems: [User] = []
    
    func fetchFeed(userToken: String) {
        NetworkManager.sendGet(url: Endpoints.feed.url, token: userToken) { json in
            
            self.myCheli = CheliPost(data: json["activeCheli"].dictionaryObject ?? [:])
            
            let feedData = json["feed"].arrayValue
            self.feedItems.removeAll()
            for feed in feedData {
                let feedItem = User(data: feed.dictionaryObject ?? [:])
                self.feedItems.append(feedItem)
            }
        } completionWithFailure: { error in
            print(error)
        }
    }
    
    func completeCheli(challengeId: String, userToken: String){
        let url = "\(Endpoints.completeCheli.url)/\(challengeId)"
        NetworkManager.sendPost(url: URL(string: url) ?? Endpoints.completeCheli.url, token: userToken, parameters: [:]) { json in
            
            //self.myCheli = CheliPost(data: json.dictionaryObject ?? [:])
            print(json)

        } completionWithFailure: { error in
            print(error)
        }
    }
}

