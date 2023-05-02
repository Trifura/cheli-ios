//
//  ProfileFollowersView.swift
//  Cheli
//
//  Created by Temp Guest on 02.05.2023..
//

import SwiftUI

struct ProfileFollowersView: View {
    var body: some View {
        let username: String = "Andrew Ainsley"
        let user_id: String = "@andrew_ainsley"
        let profile_picture: String = "member_bigger"
        
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
                    // napisati action
                }) {
                    Text("Follow")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 77, height: 32)
                        .background(Color("primary500"))
                        .cornerRadius(100)
                }
            }
        }
    }

struct ProfileFollowersView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFollowersView()
    }
}
