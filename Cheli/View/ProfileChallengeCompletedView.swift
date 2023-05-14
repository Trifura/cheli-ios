//
//  ProfileChallengeCompletedView.swift
//  Cheli
//
//  Created by Temp Guest on 03.05.2023..
//

import SwiftUI

struct ProfileChallengeCompletedView: View {
    //    var challenge_title: String = "Build a snowman"
    //    var challenge_date: String = "Today"
    //    var challenge_completed: String = "Completed"
    
    //    let title: String
    //    let description: String
    var cheliItem : UserChallenge
    
    
    var body: some View {
        HStack() {
            Rectangle()
                .fill(Color(hex: cheliItem.challenge?.color ?? ""))
                .frame(width: 140, height: 107)
                .cornerRadius(12)
                .overlay {
                    Text(cheliItem.challenge?.icon ?? "")
                        .font(.system(size: 48))
                }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(cheliItem.challenge?.title ?? "")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(Color("grey900"))
                        Text(cheliItem.challenge?.createdAt?.human ?? "")
                            .font(.system(size: 10))
                            .fontWeight(.medium)
                            .foregroundColor(Color("grey700"))
                        Text(cheliItem.finished ? "Completed" : "Not completed")
                            .font(.system(size: 10))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("grey800"))
                        
                        
                    }
                    .padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity,  alignment: .leading)
        }
    }
    
    struct ProfileChallengeCompletedView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileChallengeCompletedView(cheliItem: UserChallenge(data: [:]))
        }
    }
