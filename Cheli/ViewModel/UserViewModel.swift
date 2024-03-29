import Foundation

typealias completionHandler = (_ Success: Bool) -> ()

class UserViewModel: ObservableObject {
    @Published var myInfo: User = User(data: [:])
    @Published var userInfo: User = User(data: [:])
    @Published var followRequest: [FollowRequest] = []
    
    // MARK: - Login
    func loginUser(username: String, password: String, completion: @escaping completionHandler) {
        var parameters: [String: String] = [:]
        parameters = [
            "username" : username,
            "password" : password
        ]
        
        NetworkManager.sendPost(url: Endpoints.login.url, token: "", parameters: parameters, completion: { (response) in
            
            // TODO: - Check
            let responseData = response.dictionaryObject
            if let userToken = responseData?["token"] as? String {
                UserDefaults.standard.set(true, forKey: "isLogged")
                UserDefaults.standard.set(userToken, forKey: "userToken")
                completion(true)
            }
            
            // completion(true)
            
        }) { (error) in
            print(error.localizedDescription)
            completion(false)
        }
    }
    
    // MARK: - Logout
    func logoutUser() {
        UserDefaults.standard.set(false, forKey: "isLogged")
        UserDefaults.standard.removeObject(forKey: "userToken")
    }
    
    // MARK: - Register
    func registerUser(fullName: String, username: String, email: String, password: String, confirmPassword: String, completion: @escaping completionHandler) {
        var parameters: [String: String] = [:]
        parameters = [
            "fullName" :fullName,
            "username" : username,
            "email" : email,
            "password" : password,
            "confirmPassword": confirmPassword
        ]
        
        NetworkManager.sendPost(url: Endpoints.register.url, token: "", parameters: parameters, completion: { (response) in
            
            let responseData = response.dictionaryObject
            if let userToken = responseData?["token"] as? String {
                UserDefaults.standard.set(userToken, forKey: "userToken")
            }
            
            completion(true)
            
        }) { (error) in
            
            completion(false)
        }
    }
    
    // MARK: - Me
    func getMe(token: String /*completion: @escaping completionHandler*/) {
        
        NetworkManager.sendGet(url: Endpoints.me.url, token: token, completion: { (response) in
            
            let responseData = response.dictionaryObject
            self.myInfo = User(data: responseData!)
            
            print(self.myInfo.cheliPosts.count)
            //completion(true)
        }) { (error) in
            
            //completion(false)
        }
    }
    
    func getUser(userId: String, token: String /*completion: @escaping completionHandler*/) {
        let url = "\(Endpoints.getUser.url)/\(userId)"
        NetworkManager.sendGet(url: URL(string: url) ?? Endpoints.getUser.url, token: token, completion: { (response) in
            
            let responseData = response.dictionaryObject
            self.userInfo = User(data: responseData!)
            
            print(self.myInfo.cheliPosts.count)
            //completion(true)
        }) { (error) in
            
            //completion(false)
        }
    }
    
    func searchUsers(username: String, completion: @escaping ([User]) -> Void) {
        let parameters: [String: String] = [
            "username": username
        ]
        
        guard let userToken = UserDefaults.standard.string(forKey: "userToken") else {
            completion([])
            return
        }
        
        NetworkManager.sendGet(url: Endpoints.searchUsers.url, token: userToken, parameters: parameters) { response in
            // Handle the response...

            let responseData = response.arrayValue
            var users: [User] = []
            
            for userData in responseData {
                let user = User(data: userData.dictionaryObject ?? [:])
                users.append(user)
            }
            
            completion(users)
        } failure: { error in
            print(error.localizedDescription)
            completion([])
        }
    }

    
    
    func getNotifications(token: String) {
        
        NetworkManager.sendGet(url: Endpoints.notifications.url, token: token, completion: { (response) in
            
            let requestData = response.arrayValue
            self.followRequest.removeAll()
            
            for request in requestData {
                let requestItem = FollowRequest(data: request.dictionaryObject ?? [:])
                self.followRequest.append(requestItem)
            }
            //completion(true)
        }) { (error) in
            
            //completion(false)
        }
    }
}
