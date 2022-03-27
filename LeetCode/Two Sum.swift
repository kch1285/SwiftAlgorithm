//
//  Two Sum.swift
//  
//
//  Created by chihoooon on 2022/03/27.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var answer: [Int] = []
    
    for i in 0..<nums.count {
        for j in i + 1..<nums.count {
            if nums[i] + nums[j] == target {
                answer.append(i)
                answer.append(j)
            }
        }
    }
    
    return answer
}
