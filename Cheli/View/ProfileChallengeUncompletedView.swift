//
//  ProfileChallengeUncompletedView.swift
//  Cheli
//
//  Created by Temp Guest on 03.05.2023..
//

import SwiftUI

struct ProfileChallengeUncompletedView: View {
    var challenge_title: String = "Build a snowman"
    var challenge_date: String = "Today"
    var challenge_completed: String = "Not Completed"
        var body: some View {
            HStack() {
                        Image("challenge_picture_2")
                    .cornerRadius(12)
                            
                VStack(alignment: .leading, spacing: 12) {
                            Text(challenge_title)
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(Color("grey900"))
                            Text(challenge_date)
                                .font(.system(size: 10))
                                .fontWeight(.medium)
                                .foregroundColor(Color("grey700"))
                            Text(challenge_completed)
                                .font(.system(size: 10))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("grey800"))

                        
                    }
                        .padding(.horizontal, 16)
            }
            .frame(maxWidth: .infinity,  alignment: .leading)
    }

}

struct ProfileChallengeUncompletedView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileChallengeUncompletedView()
    }
}