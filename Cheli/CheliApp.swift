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
//            if userStore.isLogged {
//                NavigationView()
//                .environmentObject(userStore)
//            } else {
//                LandingView()
//                    .environmentObject(userStore)
//            }

            NavigationView()
                .environmentObject(userStore)
                .fullScreenCover(isPresented: !$userStore.isLogged) {
                    LandingView()
                        .environmentObject(userStore)
                }
        }
    }
}


prefix func ! (value: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { !value.wrappedValue },
        set: { value.wrappedValue = !$0 }
    )
}

