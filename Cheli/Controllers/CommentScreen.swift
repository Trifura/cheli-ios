//
//  CommentScreen.swift
//  Cheli
//
//  Created by Students on 22.05.2023..
//

import SwiftUI

struct CommentScreen: View {
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CommentsTextView()
                    /*AcceptFollowRequests(initials: "EK", fullName: "Ema Kurevija", username: "emica03")
                        .padding(.bottom, 24)
                    
                    AcceptFollowRequests(initials: "EK", fullName: "Ema Kurevija", username: "emica03")
                        .padding(.bottom, 24)
                    
                    AcceptFollowRequests(initials: "EK", fullName: "Ema Kurevija", username: "emica03")
                        .padding(.bottom, 24)
                    
                    AcceptFollowRequests(initials: "EK", fullName: "Ema Kurevija", username: "emica03")
                        .padding(.bottom, 24)
                    
                    AcceptFollowRequests(initials: "EK", fullName: "Ema Kurevija", username: "emica03")
                        .padding(.bottom, 24)
                    
                    AcceptFollowRequests(initials: "EK", fullName: "Ema Kurevija", username: "emica03")
                        .padding(.bottom, 24)
                    
                    AcceptFollowRequests(initials: "EK", fullName: "Ema Kurevija", username: "emica03")
                        .padding(.bottom, 24)
                    
                    AcceptFollowRequests(initials: "EK", fullName: "Ema Kurevija", username: "emica03")
                        .padding(.bottom, 24)
                    
                    AcceptFollowRequests(initials: "EK", fullName: "Ema Kurevija", username: "emica03")
                        .padding(.bottom, 24)*/
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            AddCommentView(initials: "JK")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct CommentScreen_Previews: PreviewProvider {
    static var previews: some View {
        CommentScreen()
    }
}
