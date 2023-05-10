//
//  UserViewModel.swift
//  Cheli
//


import Foundation

typealias completionHandler = (_ Success: Bool) -> ()

class UserViewModel: ObservableObject {
    @Published var myInfo: User = User(data: ["username": "hrasta", "fullName": "Borna Hrastović", "email": "bhrastovic@gmail.com"])
    
    // MARK: - Login
    func loginUser(username: String, password: String, completion: @escaping completionHandler) {
        var parameters: [String: String] = [:]
        parameters = [
            "username" : username,
            "password" : password
        ]
        
        NetworkManager.sendPost(url: Endpoints.login.url, token: "", parameters: parameters, completion: { (response) in
            
            UserDefaults.standard.set(true, forKey: "isLogged")
            // TODO: - Check
            let responseData = response.dictionaryObject
            if let userToken = responseData?["token"] as? String {
                UserDefaults.standard.set(userToken, forKey: "userToken")
            }
            
            completion(true)
            
        }) { (error) in
            
            completion(false)
        }
    }
    
    // MARK: - Logout
    
    // UserDefaults.standard.set(false, forKey: "isLogged")
    
    // MARK: - Register
    
    // MARK: - Me
    func getMe(/*completion: @escaping completionHandler*/) {
        
        NetworkManager.sendGet(url: Endpoints.me.url, token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1dWlkIjoiZWQ1Zjg0MmMtYjg4ZC00ZGVkLWJiNGUtM2Q5YmQ0NjY3NDkzIiwiaWF0IjoxNjgzNzE0OTk3LCJleHAiOjE2ODQzMTk3OTd9.-7rHhyQGlcM7p-2xLjJS9pjFOquKHeNhKIwCEyK0oY0", completion: { (response) in
            
            let responseData = response.dictionaryObject
            
            self.myInfo = User(data: responseData!)
       
            //completion(true)
        }) { (error) in
            
            //completion(false)
        }
    }
}
