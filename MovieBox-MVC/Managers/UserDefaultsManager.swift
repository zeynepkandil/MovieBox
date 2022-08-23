//
//  UserDefaultsManager.swift
//  MovieBox-MVC
//
//  Created by Kafein on 23.08.2022.
//

import Foundation

class UserDefaultsManager {
    
    let jsonEncoder = JSONEncoder()
    let jsonDecoder = JSONDecoder()
    let defaults = UserDefaults.standard
    
    //MARK: --- AccessToken
    public func setAccessToken(accessToken: String?) {
        defaults.set(accessToken, forKey:"accessToken")
        defaults.synchronize()
    }
    public func removeAccessToken(){
        defaults.set(nil, forKey:"accessToken")
    }
    public func getAccessToken() -> String? {
        return defaults.value(forKey: "accessToken") as? String
    }
    
}
