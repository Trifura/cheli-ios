//
//  CommentView.swift
//  Cheli
//
//  Created by Students on 26.05.2023..
//

import SwiftUI

struct CommentView: View {
    let initials: String
    let username: String
    let comment: String
    
    var body: some View {
        VStack {
            HStack {
                Image("")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .background(Color.red)
                    .mask(Circle().frame(height: 45).foregroundColor(.red))
                    .overlay(
                        Text(initials)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                    )
                VStack(alignment: .leading, spacing: 5) {
                    Text(username)
                        .font(.system(size: 15, weight: .bold))
                    Text(comment)
                        .font(.system(size: 13))
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(initials: "JD", username: "johndoe", comment: "This is a comment.")
    }
}
