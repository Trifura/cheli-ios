//
//  ProfileScreen.swift
//  Cheli
//


import SwiftUI

struct ProfileScreen: View {
    @ObservedObject var userModel: UserViewModel = UserViewModel()
    
    init() {
        userModel.getMe()
    }
    var body: some View {
        ScrollView {
            VStack() {
                TitleProfileView()
                    .padding(.top, 16)
                    .padding(.bottom, 24)
                Image("profile_background")
                    .resizable()
                    .frame(height: 120)
                ProfileFollowersView(fullName: userModel.myInfo.fullName, username: userModel.myInfo.username, initials: userModel.myInfo.initials)
                    .padding(.top, 24)
                CheliProfileFollowers(followingCount: userModel.myInfo.followingCount, followedByCount: userModel.myInfo.followedByCount, challengesCount: userModel.myInfo.challengesCount)
                CheliView()
                
                /*ForEach(userModel.myInfo.challenges, id: \.self) {item in
                    CheliAllCompletedChallenges(title: item.title, description: item.description)*/
                }

            }
            .padding(.horizontal, 24)
        }
    }

    @ViewBuilder
    //TODO Hardcoded width?
    func CheliProfileFollowers(followingCount: Int, followedByCount: Int, challengesCount: Int) -> some
        View{
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

func CheliAllCompletedChallenges(title: String, description: String) -> some
    View {
        VStack(){
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


struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
