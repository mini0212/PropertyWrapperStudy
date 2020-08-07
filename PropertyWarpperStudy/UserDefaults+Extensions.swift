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
