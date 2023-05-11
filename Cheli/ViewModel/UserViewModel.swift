import Foundation

typealias completionHandler = (_ Success: Bool) -> ()

class UserViewModel: ObservableObject {
    @Published var myInfo: User = User(data: [:])
    
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
    func registerUser(name: String, username: String, email: String, password: String, completion: @escaping completionHandler) {
        var parameters: [String: String] = [:]
        parameters = [
            "name" : name,
            "username" : username,
            "email" : email,
            "password" : password
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
       
            print(self.myInfo.challenges.count)
            //completion(true)
        }) { (error) in
            
            //completion(false)
        }
    }
}
