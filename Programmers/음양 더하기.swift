//
//  음양 더하기.swift
//  
//
//  Created by chihoooon on 2022/02/01.
//

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer = 0
    
    for i in 0..<absolutes.count {
        if signs[i] {
            answer += absolutes[i]
        }
        else {
            answer += -1 * absolutes[i]
        }
    }
    return answer
}
