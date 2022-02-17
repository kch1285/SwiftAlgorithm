//
//  이중우선순위큐.swift
//  
//
//  Created by chihoooon on 2022/02/17.
//

import Foundation

func solution(_ operations:[String]) -> [Int] {
    var priorityQueue: [Int] = []
    
    for operation in operations {
        let command = operation.components(separatedBy: " ")
        
        switch command[0] {
        case "I":
            priorityQueue.append(Int(command[1])!)
            priorityQueue.sort(by: >)
        case "D":
            if !priorityQueue.isEmpty {
                if command[1] == "-1" {
                    priorityQueue.removeLast()
                }
                else {
                    priorityQueue.removeFirst()
                }
            }
        default:
            break
        }
    }
    
    if priorityQueue.isEmpty {
        return [0, 0]
    }
    
    return [priorityQueue.max()!, priorityQueue.min()!]
}
