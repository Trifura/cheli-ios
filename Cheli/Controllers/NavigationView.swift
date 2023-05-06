//
//  ContentView.swift
//  Cheli
//


import SwiftUI

struct NavigationView: View {
    @State var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomeScreen()
                .tag(0)
                .tabItem {
                    Label {
                        Text("Home")
                    } icon: {
                        Image(selection == 0 ? "home_tab_selected" : "home_tab_unselected")
                            .foregroundColor(Color("dark4"))
                    }
                }
            JoinScreen()
                .tag(1)
                .tabItem {
                    Label {
                        Text("Join")
                    } icon: {
                        Image("logo_manji")
                    }
                }
            ProfileScreen()
                .tag(2)
                .tabItem {
                    Label {
                        Text("Profile")
                    } icon: {
                        Image(selection == 2 ? "profile_tab_selected" :
                            "profile_tab_unselected")
                    }
                }
        }
        .accentColor(Color("dark4"))
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}