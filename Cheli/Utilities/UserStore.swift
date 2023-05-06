//
//  UserStore.swift
//  Treblle v2
//


import SwiftUI


class UserStore: ObservableObject {

    @Published var isLogged : Bool =
        UserDefaults.standard.bool(forKey: "isLogged")
    {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    }

  //  @Published var user: User?
    @Published var userToken: String = ""

    init() {
        if let data = UserDefaults.standard.string(forKey: "userToken") {
            self.userToken = data
        }
    }

    func setMainUser() {
        if let data = UserDefaults.standard.string(forKey: "userToken") {
            self.userToken = data
        }
    }
}
