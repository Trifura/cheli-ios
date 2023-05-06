//
//  ProfileFollowersView.swift
//  Cheli
//
//  Created by Temp Guest on 02.05.2023..
//

import SwiftUI

struct ProfileFollowersView: View {
    let username: String = "Andrew Ainsley"
    let user_id: String = "@andrew_ainsley"
    let profile_picture: String = "member_bigger"
    @State var is_following: Bool = false

    var body: some View {
            HStack {
                Image(profile_picture)
                VStack(alignment: .leading) {
                    
                    Text(username)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color("grey900"))
                        .padding(.bottom, 0.5)
                    Text(user_id)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color("grey700"))
                    
                }
                .padding(.leading, 10)
                Spacer()
                Button(action: {
                    is_following.toggle()
                }) {
                    Text(is_following ? "Following" : "Follow")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(is_following ? Color("dark4") : .white)
                        .frame(width: 77, height: 32)
                        .background(Color(is_following ? "white" : "primary500"))
                        .cornerRadius(100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(.black, lineWidth: is_following ? 2: 0)
                        )
                }

            }
        }
    }

struct ProfileFollowersView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFollowersView()
    }
}
