//
//  프린터.swift
//  
//
//  Created by chihoooon on 2022/02/07.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priorities = priorities
    var location = location
    var answer = 0
    
    while !priorities.isEmpty {
        if priorities[0] >= priorities.max()! {
            answer += 1
            if location == 0 {
                break
            }
        }
        else {
            priorities.append(priorities[0])
        }
        priorities.removeFirst()
        location -= 1
        if location < 0 {
            location = priorities.count - 1
        }
    }
    return answer
}
