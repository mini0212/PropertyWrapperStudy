//
//  UserDefaults+Extensions.swift
//  PropertyWarpperStudy
//
//  Created by 김성민 on 2020/08/07.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation

//struct AppData {
//    @UserDefaultsWrapper(key: "user_info", defaultValue: [])
//    static var userInfo: [UserInfo]
//}

@propertyWrapper
struct UserDefaultsWrapper<T: Codable> {
    let key: String
    let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            guard let jsonData = UserDefaults.standard.data(forKey: key),
                let value = try? JSONDecoder().decode(T.self, from: jsonData) else {
                    return defaultValue
            }
            return value
        }
        set {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            guard let jsonData = try? jsonEncoder.encode(newValue) else { return }
            UserDefaults.standard.set(jsonData, forKey: key)
        }
    }
}


