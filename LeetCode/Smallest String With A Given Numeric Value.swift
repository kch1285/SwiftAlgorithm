//
//  Smallest String With A Given Numeric Value.swift
//  
//
//  Created by chihoooon on 2022/03/23.
//

import Foundation

func getSmallestNumberArray(_ n: Int, _ k: Int) -> [Int] {
    var numbers = Array(repeating: 1, count: n)
    var idx = n - 1
    var k = k - n
    
    while(k > 0){
        numbers[idx] += min(k, 25)
        idx -= 1
        k -= min(k, 25)
    }
    
    return numbers
}

func getSmallestString(_ n: Int, _ k: Int) -> String {
    let smallestNumberArray = getSmallestNumberArray(n, k)
    var answer = ""
    for number in smallestNumberArray{
        answer.append(String(UnicodeScalar(number + 96)!))
    }
    
    return answer
}
