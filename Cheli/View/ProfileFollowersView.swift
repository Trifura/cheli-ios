//
//  ProfileFollowersView.swift
//  Cheli
//

import SwiftUI

struct ProfileFollowersView: View {
    //var fullName: String = ""
    //var username: String = ""
    var fullName: String
    var username: String
    let initials: String
    var showFollowButton: Bool = true
    var showSignOutButton: Bool = true
    
    @State var is_following: Bool = false
    @EnvironmentObject var userStore: UserStore
    @ObservedObject var viewModel: UserViewModel = UserViewModel()
    
    var body: some View {
        HStack {
            //Image(profile_picture)
            Image("")
                .resizable()
                .frame(width: 60, height: 60)
                .background(Color.red)
                .mask(Circle().frame(height: 60).foregroundColor(.red))
                .overlay(
                    Text(initials)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 60, height: 60)
                )
            
            VStack(alignment: .leading) {
                
                Text(fullName)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color("grey900"))
                    .padding(.bottom, 0.5)
                Text("@"+username)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color("grey700"))
                
            }
            .padding(.leading, 10)
            Spacer()
            if showFollowButton {
                Button(action: {
                    is_following.toggle()
                }) {
                    Text(is_following ? "Following" : "Follow")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(is_following ? Color("dark4") : .white)
                        .frame(width: 77, height: 32)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .background(Color(is_following ? "white" : "primary500"))
                        .cornerRadius(100)
                    
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .stroke(.black, lineWidth: is_following ? 2: 0)
                        )
                }
            }
            if showSignOutButton {
                Button(action: {
                    userStore.isLogged = false
                    viewModel.logoutUser()
                }) {
                    Text("Sign out")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Color("logOut"))
                        .foregroundColor(.white)
                        .cornerRadius(100)
                }
            }
            
        }
        
    }
}

struct ProfileFollowersView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileFollowersView(fullName: "John Doe", username: "johndoe", initials: "JD")
    }
}
