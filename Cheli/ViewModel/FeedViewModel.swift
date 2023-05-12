//
//  FeedViewModel.swift
//  Cheli
//


import Foundation
import SwiftUI
import Alamofire

class FeedViewModel: ObservableObject {
    @Published var myCheli : FeedItem?
    @Published var feedItems: [FeedItem] = []
    
    func fetchFeed(userToken: String) {
        NetworkManager.sendGet(url: Endpoints.feed.url, token: userToken) { json in
            
            self.myCheli = FeedItem(data: json["myChallenge"].dictionaryObject ?? [:])
           
            let feedData = json["feed"].arrayValue
            for feed in feedData {
                let feedItem = FeedItem(data: feed.dictionaryObject ?? [:])
                self.feedItems.append(feedItem)
            }
        } completionWithFailure: { error in
            print(error)
        }
    }
    
    func completeChallenge(challengeId: String, userToken: String){
        let url = "\(Endpoints.completeChallenge.url)/\(challengeId)"
        NetworkManager.sendPost(url: URL(string: url) ?? Endpoints.completeChallenge.url, token: userToken, parameters: [:]) { json in
            
            //self.myCheli = FeedItem(data: json.dictionaryObject ?? [:])
            print(json)

        } completionWithFailure: { error in
            print(error)
        }
    }
}

