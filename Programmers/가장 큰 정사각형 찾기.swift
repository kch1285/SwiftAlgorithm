//
//  가장 큰 정사각형 찾기.swift
//  
//
//  Created by chihoooon on 2022/02/03.
//

import Foundation

func solution(_ board: [[Int]]) -> Int {
    var answer: Int = 0
    var dp = board
    
    if dp.count == 1 || dp[0].count == 1 {
        dp.forEach {
            if $0.max() == 1 {
                answer = 1
            }
        }
        return answer
    }
    
    for i in 1..<dp.count {
        for j in 1..<dp[i].count {
            if dp[i][j] == 1 {
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1
                answer = max(answer, dp[i][j])
            }
        }
    }
    
    return answer * answer
}
