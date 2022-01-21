//
//  기능개발.swift
//  
//
//  Created by chihoooon on 2022/01/21.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer: [Int] = []
    var deployment: [Int] = []
    
    for i in 0..<progresses.count {
        let remain = Double(100 - progresses[i])
        let speed = Double(speeds[i])
        deployment.append(Int(ceil(remain / speed)))
    }
    
    var date = deployment[0]
    var deploy = 1
    
    for i in 1..<deployment.count {
        if date >= deployment[i] {
            deploy += 1
        }
        else {
            answer.append(deploy)
            date = deployment[i]
            deploy = 1
        }
    }
    answer.append(deploy)
    
    return answer
}
