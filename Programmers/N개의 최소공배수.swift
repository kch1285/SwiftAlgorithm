//
//  N개의 최소공배수.swift
//  
//
//  Created by chihoooon on 2022/01/28.
//

import Foundation

func calculateLCM(_ num1: Int, num2: Int) -> Int {
    var lcm = 0
    let greaterNum = max(num1, num2)
    let lessNum = min(num1, num2)
    var number = 2
    var tmpNum = greaterNum
    
    while true {
        if tmpNum % lessNum == 0 {
            lcm = tmpNum
            break
        }
        tmpNum = greaterNum * number
        number += 1
    }
    return lcm
}

func solution(_ arr:[Int]) -> Int {
    var number = 1
    
    arr.forEach {
        number = calculateLCM($0, num2: number)
    }
    
    return number
}
