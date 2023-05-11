//
//  ProfileScreen.swift
//  Cheli
//


import SwiftUI

struct ProfileScreen: View {
    @StateObject var userModel: UserViewModel = UserViewModel()
    @EnvironmentObject var userStore : UserStore
    
    
    var body: some View {
        ScrollView {
            VStack() {
                TitleProfileView()
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                Image("profile_background")
                    .resizable()
                    .frame(height: 120)
                ProfileFollowersView(fullName: userModel.myInfo.fullName, username: userModel.myInfo.username, initials: userModel.myInfo.initials, showFollowButton: false)
                    .padding(.top, 24)
                CheliProfileFollowers(followingCount: userModel.myInfo.followingCount, followedByCount: userModel.myInfo.followedByCount, challengesCount: userModel.myInfo.challengesCount)
                CheliView()
                
                ForEach(userModel.myInfo.challenges, id: \.self ) { cheli in
                    
                    CheliAllCompletedChallenges(title: cheli.challenge?.title ?? "", description: cheli.challenge?.description ?? "")
                }
            }
            .onAppear {
                userModel.getMe(token: userStore.userToken)
            }
            
        }
        .padding(.horizontal, 24)
        
    }
    
    @ViewBuilder
    func CheliAllCompletedChallenges(title: String, description: String) -> some View {
        VStack() {
            Rectangle()
                .frame(height: 110)
                .foregroundColor(Color("bw"))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color ("grey200"), lineWidth: 2)
                )
                .overlay {
                    ProfileChallengeCompletedView(title: title, description: description)
                }
        }
    }
    
    @ViewBuilder
    //TODO Hardcoded width?
    func CheliProfileFollowers(followingCount: Int, followedByCount: Int, challengesCount: Int) -> some
    View {
        Divider()
        HStack() {
            VStack() {
                Text(String(challengesCount))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Text("Cheli's")
            }
            .padding(.horizontal, 12)
            Divider()
            //.padding(.horizontal, 12)
            VStack() {
                Text(String(followedByCount))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Text("Followers")
            }
            .padding(.horizontal, 12)
            Divider()
            //.padding(.horizontal, 12)
            VStack() {
                Text(String(followingCount))
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Text("Following")
            }
            .padding(.horizontal, 12)
        }
        Divider()
    }
}

   




struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
