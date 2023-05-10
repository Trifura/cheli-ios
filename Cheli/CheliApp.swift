//
//  CheliApp.swift
//  Cheli
//


import SwiftUI

@main
struct CheliApp: App {
    
    @ObservedObject var userStore: UserStore = UserStore()
    
    var body: some Scene {
        WindowGroup {
            if userStore.isLogged {
                NavigationView()
                .environmentObject(userStore)
            } else {
                LandingView()
                    .environmentObject(userStore)
            }
        }
    }
}

