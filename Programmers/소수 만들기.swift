//
//  소수 만들기.swift
//  
//
//  Created by chihoooon on 2022/02/12.
//

import Foundation

func isPrime(_ number: Int) -> Bool {
    if number == 1 {
        return false
    }
    
    for i in 2..<number {
        if number.isMultiple(of: i) {
            return false
        }
    }
    return true
}

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    var numbers: [Int] = []
    
    for i in 0...nums.count - 3 {
        for j in i+1...nums.count - 2 {
            for k in j+1...nums.count - 1 {
                numbers.append(nums[i] + nums[j] + nums[k])
            }
        }
    }
    
    for i in 0..<numbers.count {
        if isPrime(numbers[i]) {
            answer += 1
        }
    }
    return answer
}
