//
//  FeedViewModel.swift
//  Cheli
//


import Foundation
import SwiftUI
import Alamofire

class FeedViewModel: ObservableObject {
    @Published var feedItems: [FeedItem] = []
    
    func fetchFeed(userToken: String) {
        NetworkManager.sendGet(url: Endpoints.feed.url, token: userToken) { json in
            
            let feedData = json.arrayValue
            for feed in feedData {
                let feedItem = FeedItem(data: feed.dictionaryObject ?? [:])
                self.feedItems.append(feedItem)
            }
            
            print(json)
        } completionWithFailure: { error in
            print(error)
        }
    }
    
}

