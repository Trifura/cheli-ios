//
//  NetworkManager.swift


import SwiftUI
import Alamofire
import SwiftyJSON

struct NetworkManager {

    // MARK: - Requests
    static func sendPost(url:URL, token: String, parameters:[String:Any], completion: @escaping ((_ json: JSON) -> Void), completionWithFailure: @escaping ((_ error: NSError) -> Void)) {
        
        let token = "Bearer \(token)"
        let headers: HTTPHeaders = [
                    "Authorization": token,
                    "Accept": "application/json"
        ]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseData { data in
            if data.value != nil {
                let json = JSON(data.value as Any)
                let status = json["status"].boolValue
                if status {
                    OnMainThread {
                        completion(json)
                    }
                }  else {
                    OnMainThread {
                        let message: String? = json["message"].string
                        
                        let error = NSError(domain: "Custom domain", code: 2, userInfo: [NSLocalizedDescriptionKey: message ?? "Something went wrong"])
                        completionWithFailure(error)
                    }
                }
            } else {
                if let data = data.data {
                    let json = JSON(data)
                    let message = json["message"].string
                    let error = NSError(domain: "Custom domain", code: 2, userInfo: [NSLocalizedDescriptionKey: message ??  "Something went wrong"])
                    completionWithFailure(error)
                } else {
                    let error = NSError(domain: "Custom domain", code: 2, userInfo: [NSLocalizedDescriptionKey: data.error?.localizedDescription ??  "Something went wrong"])
                    completionWithFailure(error)
                }
                
            }
        }
    }
    
    static func sendGet(url:URL, token: String, params: [String: Any] = [:], completion: @escaping ((_ json: JSON) -> Void), completionWithFailure: @escaping ((_ error: NSError) -> Void)) {
        
        print("pusi kurac pederu")
        
        let token = "Bearer \(token)"
        let headers: HTTPHeaders = [
                    "Authorization": token,
                    "Accept": "application/json"
        ]
        
        print(headers)

         AF.request(url, method: .get, parameters: params, headers: headers).validate().responseData { data in
             print("picketino", data, "wtf")
             
            if data.value != nil {
                let json = JSON(data.value as Any)
                
                print(json)
               
                //let status = json["status"].boolValue
                
                //if status {
                    OnMainThread {
                        completion(json)
                    }
                /*}  else {
                    OnMainThread {
                        let message: String? = json["message"].string
                        
                        let error = NSError(domain: "Custom domain", code: 2, userInfo: [NSLocalizedDescriptionKey: message ?? "Something went wrong"])
                        completionWithFailure(error)
                    }
                }*/
            } else {
                if let data = data.data {
                    let json = JSON(data)
                    let message = json["message"].string
                    let error = NSError(domain: "Custom domain", code: 2, userInfo: [NSLocalizedDescriptionKey: message ??  "Something went wrong"])
                    completionWithFailure(error)
                } else {
                    let error = NSError(domain: "Custom domain", code: 2, userInfo: [NSLocalizedDescriptionKey: data.error?.localizedDescription ??  "Something went wrong"])
                    completionWithFailure(error)
                }
            }
        }
    }
}

func OnMainThread(_ block: @escaping (() -> Void)) {
    DispatchQueue.main.async(execute: block)
}
