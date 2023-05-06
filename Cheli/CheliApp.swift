//
//  CheliApp.swift
//  Cheli
//


import SwiftUI

@main
struct CheliApp: App {
    
    @ObservedObject var userStore: UserStore = UserStore()

    var body: some Scene {
        
        // TODO: - check if user is logged in
        WindowGroup {
          //  if userStore.isLogged {
                NavigationView()
                    .environmentObject(userStore)
         //   } else {
                // LandingView()
         //   }
        }
    }
}
