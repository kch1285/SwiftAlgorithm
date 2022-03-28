//
//  Min Cost Climbing Stairs.swift
//  
//
//  Created by chihoooon on 2022/03/28.
//

import Foundation

func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var dp = Array(repeating: 0, count: cost.count)
    
    dp[0] = cost[0]
    dp[1] = cost[1]
    
    for i in 2..<cost.count {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
    }
    
    return min(dp[cost.count - 1], dp[cost.count - 2])
}
