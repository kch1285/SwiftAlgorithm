//
//  Smallest String With A Given Numeric Value.swift
//  
//
//  Created by chihoooon on 2022/03/23.
//

import Foundation

func getSmallestNumberArray(_ n: Int, _ k: Int) -> [Int] {
    var answer = Array(repeating: 1, count: n)
    let stuffing = (k - n) / 26
    
    for i in 0..<stuffing {
        answer[i] = 26
    }
    
    var currentIndex = stuffing
    var sum = answer.reduce(0) { $0 + $1 }
    
    while sum != k {
        if sum < k {
            if k - sum >= 26 {
                answer[currentIndex] = 26
            }
            else {
                answer[currentIndex] = k - sum + 1
            }
        }
        else if sum > k {
            answer[currentIndex] -= sum - k
        }
        sum += answer[currentIndex] - 1
        currentIndex += 1
    }
    
    return answer.reversed()
}

func getSmallestString(_ n: Int, _ k: Int) -> String {
    let smallestNumberArray = getSmallestNumberArray(n, k)
    var answer = ""
    for number in smallestNumberArray{
        answer.append(String(UnicodeScalar(number + 96)!))
    }
    
    return answer
}
