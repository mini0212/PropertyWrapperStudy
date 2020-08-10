//
//  UserDefaults+Extensions.swift
//  PropertyWarpperStudy
//
//  Created by 김성민 on 2020/08/07.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation

enum AppData: String {
    case userInfo
}

extension AppData {
    func save(value: Any) {
        UserDefaults.standard.set(value, forKey: rawValue)
    }
    
    func data() -> Data? {
        return UserDefaults.standard.object(forKey: rawValue) as? Data
    }
    
    func encodeSave<T: Encodable>(item: T) {
        guard let encode = try? JSONEncoder().encode(item) else { return }
        save(value: encode)
    }
    
    func decodeData<T: Decodable>(default value: T?) -> T? {
        guard let data = data(),
            let decode = try? JSONDecoder().decode(T.self, from: data) else {
                return value
        }
        return decode
    }
}

@propertyWrapper
struct UserDefaultEncoded<T: Codable> {
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
            print(value)
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
