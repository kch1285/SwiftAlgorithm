//
//  Coin Change.swift
//  
//
//  Created by chihoooon on 2022/03/21.
//

import Foundation

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        let maxNumber = 2 << 31
        var dp = Array(repeating: maxNumber, count: amount + 1)
        dp[0] = 0
        
        for coin in coins {
            if coin > amount {
                continue
            }
            for coinIndex in coin...amount {
                dp[coinIndex] = min(dp[coinIndex], dp[coinIndex - coin] + 1)
            }
        }
        
        if dp[amount] == maxNumber {
            return -1
        }
        return dp[amount]
    }
}
