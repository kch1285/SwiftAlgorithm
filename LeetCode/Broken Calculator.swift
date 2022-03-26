//
//  Broken Calculator.swift
//  
//
//  Created by chihoooon on 2022/03/26.
//

import Foundation

func brokenCalc(_ startValue: Int, _ target: Int) -> Int {
    var answer = 0
    var target = target
    
    while target > startValue {
        if target % 2 == 0 {
            target /= 2
        }
        else {
            target += 1
        }
        answer += 1
    }
    
    return answer + startValue - target
}
