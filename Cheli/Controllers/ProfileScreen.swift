//
//  ProfileScreen.swift
//  Cheli
//


import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                TitleProfileView()
                    .padding(.top, 21)
                    .padding(.bottom, 29)
                Image("profile_background")
                    .resizable()
                    .frame(height: 120)
                ProfileFollowersView()
                    .padding(.top, 24)
                CheliProfileFollowers()
                CheliView()
                CheliPastChallenge()
            }
            .padding(.horizontal, 24)
        }
    }
}

    @ViewBuilder
    //TODO Hardcoded width?
    func CheliProfileFollowers() -> some
        View{
            VStack() {
                Divider()
                HStack() {
                    VStack() {
                        Text("45")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        Text("Cheli's")
                    }
                    .frame(width: 111, height: 58)
                    Divider()
                        //.padding(.horizontal, 12)
                    VStack() {
                        Text("5.6M")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        Text("Followers")
                    }
                    .frame(width: 111, height: 58)
                    Divider()
                        //.padding(.horizontal, 12)
                    VStack() {
                        Text("200")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        Text("Following")
                    }
                    .frame(width: 111, height: 58)
                }
                Divider()
            }
        }

    func CheliPastChallenge() -> some
        View {
            VStack() {
                Rectangle()
                
            }
        }
    

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
