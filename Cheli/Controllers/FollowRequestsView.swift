//
//  FollowRequestsView.swift
//  Cheli
//
//  Created by Students on 18.05.2023..
//

import SwiftUI

struct FollowRequestsView: View {
    var body: some View {
        ScrollView {
            VStack() {
                FollowRequestsTextView()
                
                AcceptFollowRequests(initials: "EK", fullName: "Ema Kurevija", username: "emica03")
                    .padding(.bottom, 24)
                
                AcceptFollowRequests(initials: "PV", fullName: "Patricia Vujnovac", username: "pataosk")
                    .padding(.bottom, 24)
                
                AcceptFollowRequests(initials: "NŠ", fullName: "Nikol Šarac", username: "nikidgo")
                    .padding(.bottom, 24)
                

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
