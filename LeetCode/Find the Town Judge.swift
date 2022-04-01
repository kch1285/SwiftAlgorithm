//
//  Find the Town Judge.swift
//  
//
//  Created by chihoooon on 2022/04/01.
//

import Foundation

func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
    if n == 1 && trust.isEmpty {
        return 1
    }
    
    var trustInfo: [Int: Int] = [:]
    
    for t in trust {
        trustInfo[t[1]] = (trustInfo[t[1]] ?? 0) + 1
    }
    
    guard let townJudge = trustInfo.filter({ $0.value == n - 1 }).keys.first else {
        return -1
    }
    
    return trust.filter{ $0[0] == townJudge }.isEmpty ? townJudge : -1
}
