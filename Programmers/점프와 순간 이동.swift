//
//  점프와 순간 이동.swift
//  
//
//  Created by chihoooon on 2022/02/20.
//

import Foundation

func solution(_ n: Int) -> Int  {
    var answer: Int = 0
    var position = n
    
    while position > 0 {
        if position % 2 == 0 {
            position /= 2
        }
        else {
            position -= 1
            answer += 1
        }
    }
    
    return answer
}
