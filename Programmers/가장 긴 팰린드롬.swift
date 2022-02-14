//
//  가장 긴 팰린드롬.swift
//  
//
//  Created by chihoooon on 2022/02/14.
//

import Foundation

func solution(_ s: String) -> Int {
    var answer = 1
    let targetString = s.map { $0 }
    for i in 0..<targetString.count - 1 {
        for j in 0..<targetString.count - i {
            let length = targetString.count - j - i
            let start = i
            let end = targetString.count - j - 1
            var flag = true
            
            for k in 0..<length / 2 {
                if targetString[start + k] != targetString[end - k] {
                    flag = false
                    break
                }
            }
            if flag {
                answer = max(answer, length)
                break
            }
        }
    }
    
    return answer
}
