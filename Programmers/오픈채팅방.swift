//
//  오픈채팅방.swift
//  
//
//  Created by chihoooon on 2022/01/24.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    var result: [String] = []
    var user: [String: String] = [:]
    var actions: [String] = []
    var uids: [String] = []
    
    record.forEach {
        let userInfo = $0.components(separatedBy: " ")
        let action = userInfo[0]
        let uid = userInfo[1]
        
        actions.append(action)
        uids.append(uid)
        
        if action != "Leave" {
            let nickname = userInfo[2]
            user.updateValue(nickname, forKey: uid)
        }
    }
    
    for i in 0..<actions.count {
        switch actions[i] {
        case "Enter":
            result.append("\(user[uids[i]]!)님이 들어왔습니다.")
        case "Leave":
            result.append("\(user[uids[i]]!)님이 나갔습니다.")
        default:
            break
        }
    }
    return result
}
