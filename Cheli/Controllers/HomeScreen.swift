//
//  HomeScreen.swift
//  Cheli
//


import SwiftUI

struct HomeScreen: View {
    var colors : [Color] = [.purple, .red, .yellow, .blue]
    var emoji : [String] = ["☃️", "⚽️", "💕", "🌸"]
  
    var body: some View {
        ScrollView {
            VStack {
                TitleView()
                .padding(.top, 16)
                .padding(.bottom, 24)
                CheliActiveChallenge()
                MyFeedView()
                    
                LazyVStack(spacing: 20) {
                    //start
                    ForEach(0..<10) { _ in
                        CheliItemView(icon: emoji.randomElement() ?? "🥰", title: "Build a Snowman With a Bunch of Your Friends In an Hour")
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }
    
    @ViewBuilder
    func CheliItemView(icon: String, title: String) -> some View {
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
            Divider()
            HStack {
                MemberView()
                Spacer()
                Text("2 seconds ago")
                    .font(.system(size: 12))
                    .foregroundColor(Color("dark4"))
            }
        }
            
        .modifier(ContainerViewModifier())
    }
}

    func CheliActiveChallenge() -> some
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
                        ActiveView()
                            .padding(.leading, 28.0)
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
