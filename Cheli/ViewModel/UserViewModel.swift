//
//  UserViewModel.swift
//  Cheli
//


import Foundation

typealias completionHandler = (_ Success: Bool) -> ()

class UserViewModel: ObservableObject {
    
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
}
