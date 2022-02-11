//
//  멀리 뛰기.swift
//  
//
//  Created by chihoooon on 2022/02/11.
//

import Foundation

func solution(_ n: Int) -> Int {
    var dp = Array(repeating: 0, count: n)
    if n < 2 {
        return 1
    }
    
    dp[0] = 1
    dp[1] = 2
    
    for i in 2..<n {
        dp[i] = dp[i - 1] + dp[i - 2]
        dp[i] %= 1234567
    }
    
    return dp[n - 1]
}
