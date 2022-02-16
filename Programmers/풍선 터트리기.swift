//
//  풍선 터트리기.swift
//  
//
//  Created by chihoooon on 2022/02/16.
//

import Foundation

func solution(_ a: [Int]) -> Int {
    var answer = 1
    var start = 0
    var end = a.count - 1
    var leftMin = a[start]
    var rightMin = a[end]
    
    while start < end {
        if leftMin < rightMin {
            end -= 1
            if rightMin > a[end] {
                rightMin = a[end]
                answer += 1
            }
        }
        else {
            start += 1
            if leftMin > a[start] {
                leftMin = a[start]
                answer += 1
            }
        }
    }
    
    return answer
}
