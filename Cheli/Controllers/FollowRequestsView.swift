//
//  FollowRequestsView.swift
//  Cheli
//
//  Created by Students on 18.05.2023..
//

import SwiftUI

struct FollowRequestsView: View {
    @StateObject var userModel: UserViewModel = UserViewModel()
    @EnvironmentObject var userStore : UserStore
    
    var body: some View {
        ScrollView {
            VStack() {
                FollowRequestsTextView()
                    .onAppear {
                        userModel.getNotifications(token: userStore.userToken)
                    }
                
                ForEach(userModel.followRequest, id: \.self ) { followRequest in
                    
                    AcceptFollowRequests(followRequest: followRequest)
                        .padding(.bottom, 24)
                }

                
                /*AcceptFollowRequests(initials: "EK", fullName: "Ema Kurevija", username: "emica03")
                    .padding(.bottom, 24)
                
                AcceptFollowRequests(initials: "PV", fullName: "Patricia Vujnovac", username: "pataosk")
                    .padding(.bottom, 24)
                
                AcceptFollowRequests(initials: "NŠ", fullName: "Nikol Šarac", username: "nikidgo")
                    .padding(.bottom, 24)
                */

            }
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct FollowRequestsView_Previews: PreviewProvider {
    static var previews: some View {
        FollowRequestsView()
    }
}
