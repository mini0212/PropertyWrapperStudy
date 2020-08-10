//
//  UserModel.swift
//  PropertyWarpperStudy
//
//  Created by 김성민 on 2020/08/07.
//  Copyright © 2020 min. All rights reserved.
//

import Foundation

struct UserInfo: Codable, Equatable {
    let name: String?
    let phone: String?
    let date: Date
}

// equatable의 비교 연산자는 static함수이기 때문에 전역으로 선언할 경우
// 실제로 static으로 선언되었을 때와 동일한 동작을 한다
func ==(lhs: UserInfo, rhs: UserInfo) -> Bool {
    return lhs.name == rhs.name && lhs.phone == rhs.phone
}
