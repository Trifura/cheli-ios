//
//  HomeScreen.swift
//  Cheli
//


import SwiftUI

struct HomeScreen: View {
    var colors : [Color] = [.purple, .red, .yellow, .blue]
    var emoji : [String] = ["☃️", "⚽️", "💕", "🌸"]
    @StateObject var viewModel: FeedViewModel = FeedViewModel()
    @EnvironmentObject var userStore: UserStore
    
    
    var body: some View {
        ScrollView {
            VStack {
                TitleView()
                .padding(.top, 16)
                .padding(.bottom, 24)
                CheliActiveChallenge(viewModel: viewModel)
                MyFeedView()
                    
                LazyVStack(spacing: 20) {
                    //start
                    ForEach(viewModel.feedItems, id: \.self) {item in
                        CheliItemView(icon: emoji.randomElement() ?? "🥰", title: item.challenge.title, description: item.challenge.description, fullName: item.user.fullName)
                    }
                    
                   /* ForEach(0..<10) { _ in
                        CheliItemView(icon: emoji.randomElement() ?? "🥰", title: "Build a Snowman With a Bunch of Your Friends In an Hour!!!")
                    } */
                }
               
            }
            .padding(.horizontal, 24)
            .onAppear {
                viewModel.fetchFeed(userToken: userStore.userToken)
            }
            .onChange(of: userStore.isLogged) { newValue in
                if newValue == true {
              //  if userStore.userToken != "" {
                    print(userStore.userToken)
                    viewModel.fetchFeed(userToken: userStore.userToken)
                }
                    
               // }
            }
        }
    }
    
    @ViewBuilder
    func CheliItemView(icon: String, title: String, description: String, fullName: String) -> some View {
        VStack(alignment: .leading, spacing: 10){ 
            Rectangle()
                .fill(colors.randomElement() ?? .purple)
                .frame(height: 140)
                .padding(.horizontal, -16)
                .padding(.top, -16)
                .overlay {
                    Text(icon)
                        .font(.system(size: 80))
                }
            
            Text(title)
                .foregroundColor(Color("dark4"))
                .font(.system(size: 16, weight: .bold))
         // TODO: - remove
//            Divider()
            Text(description)
                .font(.system(size: 12))
                .foregroundColor(Color("dark4").opacity(0.8))
            HStack {
                MemberView(fullName: fullName)
                Spacer()
                Text("2 seconds ago")
                    .font(.system(size: 12))
                    .foregroundColor(Color("dark4"))
            }
        }
            
        .modifier(ContainerViewModifier())
    }
}

func CheliActiveChallenge(viewModel: FeedViewModel) -> some
        View {
            VStack(alignment: .leading, spacing: 10){
                Rectangle()
                //TODO Gradient
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.purple.opacity(0.7)]), startPoint: .top, endPoint: .bottom))
                    .overlay(
                        Image("active_feed_background")

                        )
                    .frame(height: 250)
                    .mask {
                        RoundedRectangle(cornerRadius: 16)
                    }
                    .overlay {
                        ActiveView(myCheli: viewModel.myCheli ?? FeedItem(data: [:]))
                            .padding(.horizontal, 28.0)
                            .padding(.top, 48.0)
                            .padding(.bottom, 42.0)
                    }
                    
            }
        }

    


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
